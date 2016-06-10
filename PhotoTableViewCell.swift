//
//  PhotoTableViewCell.swift
//  OB500px
//
//  Created by Bretsko on 6/8/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import UIKit
import Async

final class PhotoTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!

    var viewModel: TableCellViewModel! {
        didSet {
            bindViewModel()
        }
    }

    func bindViewModel() {
        Async.main {
            self.nameLabel.text = self.viewModel!.nameLabelText
            SharedNetworkManager.loadImageInView(self.thumbnailImageView!, url: self.viewModel.image_url)
        }
    }
}

