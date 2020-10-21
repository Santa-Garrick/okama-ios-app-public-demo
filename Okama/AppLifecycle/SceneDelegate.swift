//
//  SceneDelegate.swift
//  Okama
//
//  Created by Pro13 on 20.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Swinject


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
   
   var window: UIWindow?
   
   func scene(_ scene: UIScene,
              willConnectTo session: UISceneSession,
              options connectionOptions: UIScene.ConnectionOptions) {
      
      UITabBar.appearance().tintColor = UIColor.tabBarSelected
      UIBarButtonItem.appearance().tintColor = UIColor.barButtonBlue
      
      guard let scene = (scene as? UIWindowScene) else { return }
      
      let container = Container.okamaServices
      setup(container: container)

      let vc = container.resolve(MainTabBarController.self)!

      let authStatus = container.resolve(AuthStatusChecking.self)!

      authStatus.getUser { (result) in
         switch result {
         case .success(let user):
            vc.getAuthorized(with: user)
         case .failure(_):
            break
         }
      }
		
		
      window = UIWindow(windowScene: scene)
      window?.rootViewController = vc
      window?.makeKeyAndVisible()
   }
   
   private func setup(container: Container) {
      
      let lazyContainer = Container(parent: container)
      lazyContainer.register(PortfolioListFetching.self) { _ in
         LazyPortfolioFetcher()
      }
      
      let userContainer = Container(parent: container)
      userContainer.register(PortfolioListFetching.self) { _ in
         UserPortfolioFetcher()
      }
      
      
      container.register(MainTabBarController.self) { r in
         
			
			let vc = MainTabBarController()
			let auth = r.resolve(AuthStatusPublisher.self)!
         
			auth.addListener(vc)
			
         vc.constructorVC = ConstructorConfigurator(withContainer: container).makeModule() as! ConstructorViewController
         
         vc.myPortfoliosVC = (PortfolioListConfigurator(withContainer: userContainer).makeModule() as! PortfolioListViewController)
         
         vc.lazyPortfoliosVC = ((PortfolioListConfigurator(withContainer: lazyContainer).makeModule()) as! PortfolioListViewController)
         
         vc.inflationVC = (InflationsConfigurator(withContainer: container).makeModule() as! InflationContainerViewController)
         
         vc.glossaryVC = GlossaryViewController()
         
         vc.authVC = (AuthConfigurator(withContainer: container).makeModule() as! AuthViewController)
         
         return vc
      }
   }
   
   func sceneDidDisconnect(_ scene: UIScene) {
      // Called as the scene is being released by the system.
      // This occurs shortly after the scene enters the background, or when its session is discarded.
      // Release any resources associated with this scene that can be re-created the next time the scene connects.
      // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
   }
   
   func sceneDidBecomeActive(_ scene: UIScene) {
      // Called when the scene has moved from an inactive state to an active state.
      // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
   }
   
   func sceneWillResignActive(_ scene: UIScene) {
      // Called when the scene will move from an active state to an inactive state.
      // This may occur due to temporary interruptions (ex. an incoming phone call).
   }
   
   func sceneWillEnterForeground(_ scene: UIScene) {
      // Called as the scene transitions from the background to the foreground.
      // Use this method to undo the changes made on entering the background.
   }
   
   func sceneDidEnterBackground(_ scene: UIScene) {
      // Called as the scene transitions from the foreground to the background.
      // Use this method to save data, release shared resources, and store enough scene-specific state information
      // to restore the scene back to its current state.
   }
   func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
      return scene.userActivity
   }
   
}
