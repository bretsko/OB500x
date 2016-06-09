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

    var viewModel: PhotoImageViewModel!

    init(viewModel: PhotoImageViewModel) {

        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        self.navigationItem.leftItemsSupplementBackButton = true

        self.loadingIndicator.hidesWhenStopped = true
        self.loadingIndicator.stopAnimating()
        self.bindViewModel()
    }

    func bindViewModel() {

        Async.main {
            self.loadingIndicator.startAnimating()
        }

        self.viewModel.image.producer.startWithNext { image in
            Async.main {
                self.photoImageView.image = image
            }
        }

        Async.main {
            self.photoNameLabel.text = self.viewModel.photo.name

            self.authorLabel.text = self.viewModel.photo.user.username
            self.likesLabel.text = String(self.viewModel.photo.votesCount)

            self.loadingIndicator.stopAnimating()
        }
    }
}

