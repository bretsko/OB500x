//
//  TableCellViewModel.swift
//  OB500px
//
//  Created by Bretsko on 6/8/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

public final class TableCellViewModel {

    var nameLabelText: String
    var image_url: String

    init (photo: Photo) {
        self.nameLabelText = photo.name

        self.image_url = photo.images.filter {
            $0.size == ImageSize.Thumbnail.rawValue
        }.last!.url
    }
}
