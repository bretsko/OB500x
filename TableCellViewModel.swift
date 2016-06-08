//
//  TableCellViewModel.swift
//  OB500px
//
//  Created by Bretsko on 6/8/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//


public final class TableCellViewModel {

   // public let thumbnailImage: UIImage
    public var nameLabelText: String

    init (photo: Photo) {
        self.nameLabelText = photo.name
        // self.thumbnailImage =
    }
}
