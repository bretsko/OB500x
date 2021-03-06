
//
//  AppDelegate.swift
//  OB500px
//
//  Created by Bretsko on 5/20/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    var detailViewController: PhotoImageViewController? = nil
    var masterViewController: PhotoTableViewController? = nil

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let splitViewController = self.window!.rootViewController as! UISplitViewController

        self.detailViewController = splitViewController.viewControllers[splitViewController.viewControllers.count - 1] as? PhotoImageViewController

        let masterNavigationController = splitViewController.viewControllers[0] as! UINavigationController

        self.masterViewController = masterNavigationController.topViewController as? PhotoTableViewController

        self.masterViewController!.detailViewController = self.detailViewController

        self.detailViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()

        splitViewController.delegate = self

        splitViewController.preferredDisplayMode = .PrimaryOverlay

        return true
    }

    // MARK: - Split view
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {

        return true
    }
}
