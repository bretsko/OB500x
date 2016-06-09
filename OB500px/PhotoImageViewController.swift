//
//  DetailViewController.swift
//  OB500px
//
//  Created by Bretsko on 5/20/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import UIKit

class PhotoImageViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!

    @IBOutlet var authorLabel: UILabel!

    @IBOutlet var photoNameLabel: UILabel!

    @IBOutlet var likesLabel: UILabel!

    // TODO: IBAction
    @IBOutlet var photoDetailsButtons: UIButton!

    init(viewModel: PhotoImageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var viewModel: PhotoImageViewModel! {
        didSet {
            self.bindViewModel()
        }
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        self.navigationItem.leftItemsSupplementBackButton = true

    }

    func bindViewModel() {

        let image_url = self.viewModel.photo.images.filter {
            $0.size == ImageSize.Normal.rawValue
        }.last!.url

        SharedNetworkManager.requestImage(image_url).on(next: {
            self.photoImageView.image = $0

            self.photoNameLabel.text = self.viewModel.photo.name

            self.authorLabel.text = self.viewModel.photo.user.username
            self.likesLabel.text = String(self.viewModel.photo.votesCount)
        })
            .start()

    }

}

