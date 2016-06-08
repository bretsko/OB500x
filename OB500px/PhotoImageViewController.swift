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

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        self.navigationItem.leftItemsSupplementBackButton = true

    }

    func bindViewModel() {

        self.viewModel.networkManager.requestImage(self.viewModel.photo.imageURL)
            .on(next: { self.photoImageView.image = $0 })
            .start()

    }

}

