
//
//  MasterViewController.swift
//  OB500px
//
//  Created by Bretsko on 5/20/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import UIKit

public final class PhotoTableViewController: UITableViewController {

    var detailViewController: PhotoImageViewController?

    var networkManager: NetworkManager?

    override public func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? PhotoImageViewController
        }

        self.networkManager = sharedNetworkManager
        self.viewModel = PhotoTableViewModel(networkManager: networkManager!)
        self.tableView.registerNib(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCellReuseIdentifier")


           // self.tableView.registerClass(PhotoTableViewCell.self, forCellReuseIdentifier: "TableCell")

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var viewModel: PhotoTableViewModel! {
        didSet {
            self.bindViewModel()
        }
    }

    func bindViewModel() {
        viewModel.photosProducer.producer
            .on(next: { _ in self.tableView.reloadData()
        }).start()
    }

    override public func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
}

internal var sharedNetworkManager: NetworkManager {
    struct Singleton {
        static let instance = NetworkManager() }
    return Singleton.instance
}
