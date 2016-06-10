//
//  PhotoTableViewModel.swift
//  OB500px
//
//  Created by Bretsko on 6/8/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import ReactiveCocoa

public class PhotoTableViewModel {

    var photosProducer = MutableProperty<[Photo]?>(nil)

    init () {

        let image_sizes = [ImageSize.Normal, ImageSize.Thumbnail]

        let requestURL: RequestRouter = RequestRouter.PopularPhotos(image_sizes)

        SharedNetworkManager.requestSwiftyJSON(requestURL).producer.startWithNext { json in
            self.photosProducer.value = json["photos"].arrayValue.map { Photo(json: $0) }
        }
    }

}
