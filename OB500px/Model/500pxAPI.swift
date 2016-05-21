//
//	500pxAPI.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class 500pxAPI : NSObject, NSCoding{

	var currentPage : Int!
	var feature : String!
	var filters : Filter!
	var photos : [Photo]!
	var totalItems : Int!
	var totalPages : Int!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json == nil{
			return
		}
		currentPage = json["current_page"].intValue
		feature = json["feature"].stringValue
		let filtersJson = json["filters"]
		if filtersJson != JSON.nullJSON{
			filters = Filter(fromJson: filtersJson)
		}
		photos = [Photo]()
		let photosArray = json["photos"].arrayValue
		for photosJson in photosArray{
			let value = Photo(fromJson: photosJson)
			photos.append(value)
		}
		totalItems = json["total_items"].intValue
		totalPages = json["total_pages"].intValue
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if currentPage != nil{
			dictionary["current_page"] = currentPage
		}
		if feature != nil{
			dictionary["feature"] = feature
		}
		if filters != nil{
			dictionary["filters"] = filters.toDictionary()
		}
		if photos != nil{
			var dictionaryElements = [NSDictionary]()
			for photosElement in photos {
				dictionaryElements.append(photosElement.toDictionary())
			}
			dictionary["photos"] = dictionaryElements
		}
		if totalItems != nil{
			dictionary["total_items"] = totalItems
		}
		if totalPages != nil{
			dictionary["total_pages"] = totalPages
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         currentPage = aDecoder.decodeObjectForKey("current_page") as? Int
         feature = aDecoder.decodeObjectForKey("feature") as? String
         filters = aDecoder.decodeObjectForKey("filters") as? Filter
         photos = aDecoder.decodeObjectForKey("photos") as? [Photo]
         totalItems = aDecoder.decodeObjectForKey("total_items") as? Int
         totalPages = aDecoder.decodeObjectForKey("total_pages") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if currentPage != nil{
			aCoder.encodeObject(currentPage, forKey: "current_page")
		}
		if feature != nil{
			aCoder.encodeObject(feature, forKey: "feature")
		}
		if filters != nil{
			aCoder.encodeObject(filters, forKey: "filters")
		}
		if photos != nil{
			aCoder.encodeObject(photos, forKey: "photos")
		}
		if totalItems != nil{
			aCoder.encodeObject(totalItems, forKey: "total_items")
		}
		if totalPages != nil{
			aCoder.encodeObject(totalPages, forKey: "total_pages")
		}

	}

}