//
//  CardOnFileDashboardBuilder.swift
//  MiniSuperApp
//
//  Created by 이든_장진혁 on 2022/12/29.
//

import ModernRIBs

protocol CardOnFileDashboardDependency: Dependency {
    var cardOnFileRepository: CardOnFileRepository { get }
}

final class CardOnFileDashboardComponent
: Component<CardOnFileDashboardDependency>
, CardOnFileDashBoardInteractorDependency {
    var cardOnFileRepository: CardOnFileRepository { dependency.cardOnFileRepository }
}

// MARK: - Builder

protocol CardOnFileDashboardBuildable: Buildable {
    func build(withListener listener: CardOnFileDashboardListener) -> CardOnFileDashboardRouting
}

final class CardOnFileDashboardBuilder: Builder<CardOnFileDashboardDependency>, CardOnFileDashboardBuildable {

    override init(dependency: CardOnFileDashboardDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CardOnFileDashboardListener) -> CardOnFileDashboardRouting {
        let component = CardOnFileDashboardComponent(dependency: dependency)
        let viewController = CardOnFileDashboardViewController()
        let interactor = CardOnFileDashboardInteractor(
            presenter: viewController,
            dependecny: component
        )
        interactor.listener = listener
        return CardOnFileDashboardRouter(interactor: interactor, viewController: viewController)
    }
}
