
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

        let detailNavigationController = splitViewController.viewControllers[splitViewController.viewControllers.count - 1] as! UINavigationController

        self.detailViewController = detailNavigationController.topViewController as? PhotoImageViewController

        let masterNavigationController = splitViewController.viewControllers[0] as! UINavigationController

        self.masterViewController = masterNavigationController.topViewController as? PhotoTableViewController

       

//        self.masterViewController!.viewModel.photosProducer.producer.on(next: { photos in
//            let vm = PhotoImageViewModel(photo: photos![0])
//            self.detailViewController?.viewModel = vm
//            // detailViewController?.photoImageView.image = photos![0]
//        })

        // var photosProducer = MutableProperty<[Photo]?>(nil)

        // or bind with Reactive
        // var photosProducer = MutableProperty<[Photo]?>(nil)

        detailNavigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()

        splitViewController.delegate = self

        splitViewController.preferredDisplayMode = .PrimaryHidden

        return true
    }

    // MARK: - Split view
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {

        return true
    }
}
