/*
 Riblet: 라우터, 인터랙터, 빌더 의미
 -> Riblet: 화면 혹은 로직의 흐름의 묵음
 -> Input: Dependency (ex Topup 리블렛이 필요한 디펜던시의 청사진)
 -> Output: Listn
 
 Viewless 리블렛 => 비즈니스 로직 위주
 화면 전환 등 조건도 리블렛으로 동작
 
 요런 기능이 컴포지션이라 정리
 */

import UIKit
import ModernRIBs

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  private var launchRouter: LaunchRouting?
  private var urlHandler: URLHandler?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    
    let result = AppRootBuilder(dependency: AppComponent()).build()
    self.launchRouter = result.launchRouter
    self.urlHandler = result.urlHandler
    launchRouter?.launch(from: window)
    
    return true
  }
  
}

protocol URLHandler: AnyObject {
  func handle(_ url: URL)
}

