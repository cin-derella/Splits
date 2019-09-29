//
//  AppDelegate.swift
//  Splits
//
//  Created by Dante on 2019/9/28.
//  Copyright © 2019 cinderella. All rights reserved.
//

import UIKit

class SplitDelegate : UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? ImagePresentationVC else { return false }
        if topAsDetailController.image == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

    func targetDisplayModeForAction(in svc: UISplitViewController) -> UISplitViewController.DisplayMode {
        let navigationController = svc.viewControllers.last as? UINavigationController
        let vc:UIViewController = (navigationController?.topViewController)!
        if svc.displayMode == UISplitViewController.DisplayMode.primaryHidden || svc.displayMode == UISplitViewController.DisplayMode.primaryOverlay {
                vc.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"theicon120"),
                    landscapeImagePhone: UIImage(named:"theicon120"),
                    style: UIBarButtonItem.Style.plain,
                    target: vc.splitViewController!.displayModeButtonItem.target,
                    action: vc.splitViewController!.displayModeButtonItem.action)
            }else {
    // disable button on landscape
            if UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.landscapeLeft || UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.landscapeRight {
                vc.navigationItem.leftBarButtonItem?.isEnabled = false
                }
            }
        return UISplitViewController.DisplayMode.automatic
    }
}


@UIApplicationMain                                     //UISplitViewControllerDelegate
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var delegate: SplitDelegate = SplitDelegate()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        guard let window = window else { return false}
        guard let splitViewController = window.rootViewController as? UISplitViewController else { return false}
        guard let navigationController = splitViewController.viewControllers.last as? UINavigationController else { return false}
        navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        navigationController.topViewController?.navigationItem.leftBarButtonItem = nil
        navigationController.topViewController?.navigationItem.leftItemsSupplementBackButton = true
        splitViewController.delegate = delegate
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    


}

