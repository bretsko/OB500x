//
//  PhotoImageViewModel.swift
//  OB500px
//
//  Created by Bretsko on 6/5/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import ReactiveCocoa

class PhotoImageViewModel {

    let photo: Photo
    // let photo = MutableProperty<Photo?>(nil)
    var image = MutableProperty<UIImage?>(nil)

    init (photo: Photo) {
        self.photo = photo

        let image_url = photo.images.filter {
            $0.size == ImageSize.Normal.rawValue
        }.last!.url

//        self.image <~ SharedNetworkManager.requestImage(image_url).producer.first()?.value


        SharedNetworkManager.requestImage(image_url).producer.startWithNext { image in

            self.image.value = image

            print ("Image loaded")
        }

//        SharedNetworkManager.requestImage(image_url).on(next: { image in
//
//            self.image.value = image
//
//        }).start()
    }

}
