
//
//  MasterViewController.swift
//  OB500px
//
//  Created by Bretsko on 5/20/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import Async

class TableViewController: UITableViewController {

    var detailViewController: ImageViewController? = nil

    var photos = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? ImageViewController
        }

        loadPhotos()
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let cell_text = self.photos[indexPath.row]

        cell.textLabel!.text = cell_text

        return cell
    }

    func loadPhotos() {

        // passing page number
        let request: RequestRouter = RequestRouter.PopularPhotos()

        Alamofire.request(request)
            .responseSwiftyJSON { response in
                guard let json = response.result.value else {
                    return
                }
                self.parseJSON(json)

        }
    }

    func parseJSON(json: JSON) {
        Async.background {

            self.photos = json["photos"].map{ photoID, json in

            json["image_url"].stringValue

            }

        }.main {
            self.tableView.reloadData()
        }

    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        Alamofire.request(.GET, self.photos[indexPath.row])
            .responseImage { response in
                debugPrint(response)
                print(response.request)
                print(response.response)
                debugPrint(response.result)

                if let image = response.result.value {
                    print("image downloaded: \(image)")

                    self.detailViewController!.photoImage = image
                    Async.main {

                        self.splitViewController!.showDetailViewController((self.detailViewController)!, sender: self)
                    }

                }
        }
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

}
