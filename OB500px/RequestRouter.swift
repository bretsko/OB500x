//
//  RequestRouter.swift
//  OB500px
//
//  Created by Bretsko on 5/20/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import Alamofire
import Foundation

public enum ImageSize:Int {
    case Thumbnail = 1
    case Normal = 600
    case Fullscreen = 1080
}

func imageSizeConvert(sizes: [ImageSize]) -> String {

    var sizes_string_array: [String] = sizes.map { switch $0 {
        case ImageSize.Thumbnail: return "1"
        case ImageSize.Normal: return "600"
        case ImageSize.Fullscreen: return "1080"
        }
    }

    if (sizes.count > 1) {
        return sizes_string_array.joinWithSeparator(",")

    } else {
        return sizes_string_array[0]
    }
}

enum RequestRouter: URLRequestConvertible {

    static let baseURLString = "https://api.500px.com/v1"
    static let consumerKey = "MbhaNsMfhlJVGHvQzXBJhP4DsIGHkj6gkdLtRKBl"

    case PopularPhotos([ImageSize])

    var URLRequest: NSMutableURLRequest {

        let result: (path: String, parameters: [String: AnyObject]) = {
            switch self {
            case .PopularPhotos (let sizes):

                let sizes_string = imageSizeConvert(sizes)
                let params = ["consumer_key": RequestRouter.consumerKey,
                    "page": "1",
                    "feature": "popular",
                    "rpp": "50",
                    "image_size": sizes_string
                ]
                return ("/photos", params)
            }
        }()

        let URL = NSURL(string: RequestRouter.baseURLString)
        let URLRequest = NSURLRequest(URL: URL!.URLByAppendingPathComponent(result.path))
        let encoding = Alamofire.ParameterEncoding.URL

        return encoding.encode(URLRequest, parameters: result.parameters).0
    }

}


