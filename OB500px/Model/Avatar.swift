//
//	Avatar.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Avatar : NSObject, NSCoding{

	var defaultField : Default!
	var large : Default!
	var small : Default!
	var tiny : Default!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json == nil{
			return
		}
		let defaultFieldJson = json["default"]
		if defaultFieldJson != JSON.nullJSON{
			defaultField = Default(fromJson: defaultFieldJson)
		}
		let largeJson = json["large"]
		if largeJson != JSON.nullJSON{
			large = Default(fromJson: largeJson)
		}
		let smallJson = json["small"]
		if smallJson != JSON.nullJSON{
			small = Default(fromJson: smallJson)
		}
		let tinyJson = json["tiny"]
		if tinyJson != JSON.nullJSON{
			tiny = Default(fromJson: tinyJson)
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if defaultField != nil{
			dictionary["default"] = defaultField.toDictionary()
		}
		if large != nil{
			dictionary["large"] = large.toDictionary()
		}
		if small != nil{
			dictionary["small"] = small.toDictionary()
		}
		if tiny != nil{
			dictionary["tiny"] = tiny.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         defaultField = aDecoder.decodeObjectForKey("default") as? Default
         large = aDecoder.decodeObjectForKey("large") as? Default
         small = aDecoder.decodeObjectForKey("small") as? Default
         tiny = aDecoder.decodeObjectForKey("tiny") as? Default

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if defaultField != nil{
			aCoder.encodeObject(defaultField, forKey: "default")
		}
		if large != nil{
			aCoder.encodeObject(large, forKey: "large")
		}
		if small != nil{
			aCoder.encodeObject(small, forKey: "small")
		}
		if tiny != nil{
			aCoder.encodeObject(tiny, forKey: "tiny")
		}

	}

}