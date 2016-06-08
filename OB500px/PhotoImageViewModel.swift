//
//  PhotoImageViewModel.swift
//  OB500px
//
//  Created by Bretsko on 6/5/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import ReactiveCocoa

class PhotoImageViewModel {

    internal let photo: Photo

    internal var image: UIImage?

    let photoImage = MutableProperty<UIImage?>(nil)

    var networkManager: NetworkManager

    init (photo: Photo, networkManager: NetworkManager) {
        self.photo = photo
        self.networkManager = networkManager
    }
}
