//
//  Photo.swift
//  OB500px
//
//  Created by Bretsko on 6/5/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import SwiftyJSON

struct User {

    var username: String!

    init(fromJson json: JSON!) {
        if json == nil {
            return
        }
        username = json["username"].stringValue
    }
}

struct Image {

    var format: String!
    var size: Int!
    var url: String!

    init(fromJson json: JSON!) {
        if json == nil {
            return
        }
        format = json["format"].stringValue
        size = json["size"].intValue
        url = json["url"].stringValue
    }
}

struct Photo {

    var name: String!
    var images: [Image]!
    var votesCount: Int!
    var user: User!

    init(json: JSON) {

        if json == nil {
            return
        }

        name = json["name"].stringValue
        images = [Image]()

        let imagesArray = json["images"].arrayValue
        for imagesJson in imagesArray {
            let value = Image(fromJson: imagesJson)
            images.append(value)
        }

        votesCount = json["votes_count"].intValue

        let userJson = json["user"]
        if userJson != JSON.null {

            user = User(fromJson: userJson)
        }

    }
}

