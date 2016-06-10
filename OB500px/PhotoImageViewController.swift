//
//  DetailViewController.swift
//  OB500px
//
//  Created by Bretsko on 5/20/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import UIKit
import ReactiveCocoa
import Async

class PhotoImageViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!

    @IBOutlet var authorLabel: UILabel!

    @IBOutlet var photoNameLabel: UILabel!

    @IBOutlet var likesLabel: UILabel!

    // TODO: IBAction
    @IBOutlet var photoDetailsButtons: UIButton!

    @IBOutlet var loadingIndicator: UIActivityIndicatorView!

    var viewModel: PhotoImageViewModel? {
        didSet {
            guard (self.photoImageView != nil) else { return }
            self.bindViewModel()
        }
    }

    init(viewModel: PhotoImageViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        self.navigationItem.leftItemsSupplementBackButton = true

        self.loadingIndicator.hidesWhenStopped = true

        Async.main {
            self.loadingIndicator.stopAnimating()
        }

        self.bindViewModel()
    }

    func bindViewModel() {

        guard (self.viewModel != nil) else { return }

        Async.main {
            self.loadingIndicator.startAnimating()
        }

        SharedNetworkManager.requestImage(self.viewModel!.image_url).producer.startWithNext { image in

            Async.main {

                self.photoImageView.image = image

                self.photoNameLabel.text = self.viewModel!.photo.name

                self.authorLabel.text = self.viewModel!.photo.user.username
                self.likesLabel.text = String(self.viewModel!.photo.votesCount)

                self.loadingIndicator.stopAnimating()
            }
        }

    }
}

