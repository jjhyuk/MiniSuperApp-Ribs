import ModernRIBs

protocol FinanceHomeInteractable
: Interactable
, SuperPayDashBoardListener
, CardOnFileDashboardListener {
  var router: FinanceHomeRouting? { get set }
  var listener: FinanceHomeListener? { get set }
}

protocol FinanceHomeViewControllable: ViewControllable {
    func addDashboard(_ view: ViewControllable)
}

final class FinanceHomeRouter
: ViewableRouter<FinanceHomeInteractable, FinanceHomeViewControllable>, FinanceHomeRouting {
  
    private let superPayDashboardBuildable: SuperPayDashBoardBuildable
    private var superPayRouting: Routing?
    
    private let cardOnfileDashboardBuildable: CardOnFileDashboardBuildable
    private var cardOnfileDashboardRouting: Routing?
    
  init(
    interactor: FinanceHomeInteractable,
    viewController: FinanceHomeViewControllable,
    superPayDashboardBuildable: SuperPayDashBoardBuildable,
    cardOnFileDashboardBuildable: CardOnFileDashboardBuildable
  ) {
      self.superPayDashboardBuildable = superPayDashboardBuildable
      self.cardOnfileDashboardBuildable = cardOnFileDashboardBuildable
      
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
    
    func attachSuperPayDashboard() {
        if superPayRouting != nil { return }
        let router = superPayDashboardBuildable.build(withListener: interactor)
        
        let dashboard = router.viewControllable
        viewController.addDashboard(dashboard)
        
        self.superPayRouting = router
        attachChild(router)
    }
    
    func attachCardOnFileDashboard() {
        if cardOnfileDashboardRouting != nil { return }
        let router = cardOnfileDashboardBuildable.build(withListener: interactor)
        
        let dashboard = router.viewControllable
        viewController.addDashboard(dashboard)
        
        self.cardOnfileDashboardRouting = router
        attachChild(router)
    }
}
