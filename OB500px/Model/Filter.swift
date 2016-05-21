//
//	Filter.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Filter : NSObject, NSCoding{

	var category : Bool!
	var exclude : Int!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json == nil{
			return
		}
		category = json["category"].boolValue
		exclude = json["exclude"].intValue
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if category != nil{
			dictionary["category"] = category
		}
		if exclude != nil{
			dictionary["exclude"] = exclude
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         category = aDecoder.decodeObjectForKey("category") as? Bool
         exclude = aDecoder.decodeObjectForKey("exclude") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if category != nil{
			aCoder.encodeObject(category, forKey: "category")
		}
		if exclude != nil{
			aCoder.encodeObject(exclude, forKey: "exclude")
		}

	}

}