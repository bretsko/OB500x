//
//  PhotoTableViewDelegate.swift
//  OB500px
//
//  Created by Bretsko on 6/5/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import UIKit

extension PhotoTableViewController {

    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("TableCellReuseIdentifier", forIndexPath: indexPath)

        if let cell = cell as? PhotoTableViewCell {

            guard let vm = self.viewModel else {
                return cell
            }

            vm.photosProducer.producer.startWithNext { photos in
                let photo = photos![indexPath.row]

                let vm = TableCellViewModel(photo: photo)
                cell.viewModel = vm
            }
        }

        return cell
    }

    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if let indexPath = self.tableView.indexPathForSelectedRow {

            self.viewModel.photosProducer.producer.startWithNext { photos in

                guard let photo = photos?[indexPath.row] else { return }

                let vm = PhotoImageViewModel(photo: photo)

                self.detailViewController!.viewModel = vm;

                self.detailViewController!.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                self.detailViewController!.navigationItem.leftItemsSupplementBackButton = true
                self.splitViewController!.showDetailViewController(self.detailViewController!, sender: nil)

            }
        }
    }

    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {

        }
    }

    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard self.viewModel != nil else {
            return 0
        }

        guard let count = self.viewModel.photosProducer.value?.count else {
            return 0
        }
        return count

    }

    public override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    public override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}
