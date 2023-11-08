//
//  AppDelegate.swift
//  MovieApp-ProtocolOriented
//
//  Created by Kadirhan Keles on 5.11.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        /*// Override point for customization after application launch.
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.systemYellow, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 17)!]
        */
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemYellow]
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
        }
        let movieService = Webservice()
        let viewModel = HomeViewModel(movieService: movieService)
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController(viewModel: viewModel))
        window?.makeKeyAndVisible()
        return true
    }
    

}

extension UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.systemYellow, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 17)!]
    }
}
