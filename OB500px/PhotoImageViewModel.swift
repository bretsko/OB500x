//
//  PhotoImageViewModel.swift
//  OB500px
//
//  Created by Bretsko on 6/5/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

class PhotoImageViewModel {

    let photo: Photo

    var image_url: String

    init (photo: Photo) {
        self.photo = photo

        self.image_url = photo.images.filter {
            $0.size == ImageSize.Normal.rawValue
        }.last!.url

    }

}
