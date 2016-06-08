//
//  Photo.swift
//  OB500px
//
//  Created by Bretsko on 6/5/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import SwiftyJSON

public class Photo {

    var name: String!
    var imageURL: String!

    init(json: JSON) {

        if json == nil {
            return
        }

        imageURL = json["image_url"].stringValue
        name = json["name"].stringValue
    }
}
