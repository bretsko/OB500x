//
//  NetworkManager.swift
//  OB500px
//
//  Created by Bretsko on 6/5/16.
//  Copyright © 2016 Bretsko. All rights reserved.
//


import ReactiveCocoa
import Alamofire
import SwiftyJSON

public final class NetworkManager {
     private let queue = dispatch_queue_create( "ResponseQueue",   DISPATCH_QUEUE_SERIAL)

    public init() { }

    public func requestJSON(url: String) -> SignalProducer<AnyObject, NSError> {
        return SignalProducer { observer, disposable in
            Alamofire.request(.GET, url)
                .response(queue: self.queue, responseSerializer: Alamofire.Request.JSONResponseSerializer()) { response in
                    switch response.result {
                    case .Success(let value):
                        observer.sendNext(value)
                        observer.sendCompleted()
                    case .Failure(let error):
                        observer.sendFailed(error)
                    }
            }
        }
    }

    public func requestSwiftyJSON (url: URLRequestConvertible) -> SignalProducer<JSON, NSError> {
        return SignalProducer { observer, disposable in
            Alamofire.request(url)
                .responseSwiftyJSON { response in

                    switch response.result {
                    case .Success(let value):
                        observer.sendNext(value)
                        observer.sendCompleted()
                    case .Failure(let error):
                        observer.sendFailed(error)
                    }
            }
        }
    }

    public func requestImage(url: String) -> SignalProducer<UIImage, NSError> {
        return SignalProducer { observer, disposable in
            Alamofire.request(.GET, url)
                .response(queue: self.queue, responseSerializer: Alamofire.Request.dataResponseSerializer()) { response in

                    switch response.result {
                    case .Success(let data):
                        guard let image = UIImage(data: data) else {
                            return
                        }
                        observer.sendNext(image)
                        observer.sendCompleted()
                    case .Failure(let error):
                        observer.sendFailed(error)
                    }
            }
        }
    }

}
