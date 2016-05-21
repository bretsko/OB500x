//
//	Image.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Image : NSObject, NSCoding{

	var format : String!
	var httpsUrl : String!
	var size : Int!
	var url : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json == nil{
			return
		}
		format = json["format"].stringValue
		httpsUrl = json["https_url"].stringValue
		size = json["size"].intValue
		url = json["url"].stringValue
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if format != nil{
			dictionary["format"] = format
		}
		if httpsUrl != nil{
			dictionary["https_url"] = httpsUrl
		}
		if size != nil{
			dictionary["size"] = size
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         format = aDecoder.decodeObjectForKey("format") as? String
         httpsUrl = aDecoder.decodeObjectForKey("https_url") as? String
         size = aDecoder.decodeObjectForKey("size") as? Int
         url = aDecoder.decodeObjectForKey("url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if format != nil{
			aCoder.encodeObject(format, forKey: "format")
		}
		if httpsUrl != nil{
			aCoder.encodeObject(httpsUrl, forKey: "https_url")
		}
		if size != nil{
			aCoder.encodeObject(size, forKey: "size")
		}
		if url != nil{
			aCoder.encodeObject(url, forKey: "url")
		}

	}

}