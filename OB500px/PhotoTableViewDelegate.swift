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
                //cell.textLabel!.text = photo.name
            }
        }

        return cell
    }

    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        guard let viewModel = self.viewModel else {
            return
        }

        viewModel.photosProducer.producer.startWithNext { photos in
            let photo = photos![indexPath.row]

            guard let vc = self.detailViewController else { return }

            let vm = PhotoImageViewModel(photo: photo, networkManager: self.viewModel.networkManager)

            vc.viewModel = vm;

            self.navigationController?.pushViewController(vc, animated: true)

        }

    }

    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let viewModel = self.viewModel else {
            return 0
        }

        guard let count = viewModel.photosProducer.value?.count else {
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
