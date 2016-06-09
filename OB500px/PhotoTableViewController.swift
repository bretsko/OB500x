
//
//  MasterViewController.swift
//  OB500px
//
//  Created by Bretsko on 5/20/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import UIKit

public final class PhotoTableViewController: UITableViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = PhotoTableViewModel()

        self.tableView.registerNib(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCellReuseIdentifier")

        self.tableView.rowHeight = 150

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

    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {

                self.viewModel.photosProducer.producer.startWithNext { photos in
                    let photo = photos![indexPath.row]

                    let vc = (segue.destinationViewController as! UINavigationController).topViewController as! PhotoImageViewController

                    let vm = PhotoImageViewModel(photo: photo)

                    vc.viewModel = vm;

                    vc.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    vc.navigationItem.leftItemsSupplementBackButton = true

                }
            }
        }
    }

}

