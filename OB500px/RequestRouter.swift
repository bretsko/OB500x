//
//  RequestRouter.swift
//  OB500px
//
//  Created by Bretsko on 5/20/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//

import Alamofire

enum RequestRouter: URLRequestConvertible {

    static let baseURLString = "https://api.500px.com/v1"
    static let consumerKey = "MbhaNsMfhlJVGHvQzXBJhP4DsIGHkj6gkdLtRKBl"

    case PopularPhotos()

    var URLRequest: NSMutableURLRequest {

        let result: (path: String, parameters: [String: AnyObject]) = {
            switch self {
            case .PopularPhotos ():
                let params = ["consumer_key": RequestRouter.consumerKey,
                    "page": "1",
                    "feature": "popular",
                    "rpp": "50",
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
