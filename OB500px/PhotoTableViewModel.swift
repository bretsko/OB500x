//
//  PhotoTableViewModel.swift
//  OB500px
//
//  Created by Bretsko on 6/8/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import ReactiveCocoa

public class PhotoTableViewModel {

    var networkManager: NetworkManager

    var photosProducer = MutableProperty<[Photo]?>(nil)

    init (networkManager: NetworkManager) {

        self.networkManager = networkManager

        let requestURL: RequestRouter = RequestRouter.PopularPhotos()

        self.networkManager.requestSwiftyJSON(requestURL).producer.startWithNext { json in
            self.photosProducer.value = json["photos"].arrayValue.map { Photo(json: $0) }
        }
    }

}
