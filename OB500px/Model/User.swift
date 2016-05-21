//
//	User.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class User : NSObject, NSCoding{

	var affection : Int!
	var avatars : Avatar!
	var city : String!
	var country : String!
	var coverUrl : String!
	var firstname : String!
	var followersCount : Int!
	var fullname : String!
	var id : Int!
	var lastname : String!
	var storeOn : Bool!
	var upgradeStatus : Int!
	var username : String!
	var userpicHttpsUrl : String!
	var userpicUrl : String!
	var usertype : Int!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json == nil{
			return
		}
		affection = json["affection"].intValue
		let avatarsJson = json["avatars"]
		if avatarsJson != JSON.nullJSON{
			avatars = Avatar(fromJson: avatarsJson)
		}
		city = json["city"].stringValue
		country = json["country"].stringValue
		coverUrl = json["cover_url"].stringValue
		firstname = json["firstname"].stringValue
		followersCount = json["followers_count"].intValue
		fullname = json["fullname"].stringValue
		id = json["id"].intValue
		lastname = json["lastname"].stringValue
		storeOn = json["store_on"].boolValue
		upgradeStatus = json["upgrade_status"].intValue
		username = json["username"].stringValue
		userpicHttpsUrl = json["userpic_https_url"].stringValue
		userpicUrl = json["userpic_url"].stringValue
		usertype = json["usertype"].intValue
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if affection != nil{
			dictionary["affection"] = affection
		}
		if avatars != nil{
			dictionary["avatars"] = avatars.toDictionary()
		}
		if city != nil{
			dictionary["city"] = city
		}
		if country != nil{
			dictionary["country"] = country
		}
		if coverUrl != nil{
			dictionary["cover_url"] = coverUrl
		}
		if firstname != nil{
			dictionary["firstname"] = firstname
		}
		if followersCount != nil{
			dictionary["followers_count"] = followersCount
		}
		if fullname != nil{
			dictionary["fullname"] = fullname
		}
		if id != nil{
			dictionary["id"] = id
		}
		if lastname != nil{
			dictionary["lastname"] = lastname
		}
		if storeOn != nil{
			dictionary["store_on"] = storeOn
		}
		if upgradeStatus != nil{
			dictionary["upgrade_status"] = upgradeStatus
		}
		if username != nil{
			dictionary["username"] = username
		}
		if userpicHttpsUrl != nil{
			dictionary["userpic_https_url"] = userpicHttpsUrl
		}
		if userpicUrl != nil{
			dictionary["userpic_url"] = userpicUrl
		}
		if usertype != nil{
			dictionary["usertype"] = usertype
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         affection = aDecoder.decodeObjectForKey("affection") as? Int
         avatars = aDecoder.decodeObjectForKey("avatars") as? Avatar
         city = aDecoder.decodeObjectForKey("city") as? String
         country = aDecoder.decodeObjectForKey("country") as? String
         coverUrl = aDecoder.decodeObjectForKey("cover_url") as? String
         firstname = aDecoder.decodeObjectForKey("firstname") as? String
         followersCount = aDecoder.decodeObjectForKey("followers_count") as? Int
         fullname = aDecoder.decodeObjectForKey("fullname") as? String
         id = aDecoder.decodeObjectForKey("id") as? Int
         lastname = aDecoder.decodeObjectForKey("lastname") as? String
         storeOn = aDecoder.decodeObjectForKey("store_on") as? Bool
         upgradeStatus = aDecoder.decodeObjectForKey("upgrade_status") as? Int
         username = aDecoder.decodeObjectForKey("username") as? String
         userpicHttpsUrl = aDecoder.decodeObjectForKey("userpic_https_url") as? String
         userpicUrl = aDecoder.decodeObjectForKey("userpic_url") as? String
         usertype = aDecoder.decodeObjectForKey("usertype") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if affection != nil{
			aCoder.encodeObject(affection, forKey: "affection")
		}
		if avatars != nil{
			aCoder.encodeObject(avatars, forKey: "avatars")
		}
		if city != nil{
			aCoder.encodeObject(city, forKey: "city")
		}
		if country != nil{
			aCoder.encodeObject(country, forKey: "country")
		}
		if coverUrl != nil{
			aCoder.encodeObject(coverUrl, forKey: "cover_url")
		}
		if firstname != nil{
			aCoder.encodeObject(firstname, forKey: "firstname")
		}
		if followersCount != nil{
			aCoder.encodeObject(followersCount, forKey: "followers_count")
		}
		if fullname != nil{
			aCoder.encodeObject(fullname, forKey: "fullname")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if lastname != nil{
			aCoder.encodeObject(lastname, forKey: "lastname")
		}
		if storeOn != nil{
			aCoder.encodeObject(storeOn, forKey: "store_on")
		}
		if upgradeStatus != nil{
			aCoder.encodeObject(upgradeStatus, forKey: "upgrade_status")
		}
		if username != nil{
			aCoder.encodeObject(username, forKey: "username")
		}
		if userpicHttpsUrl != nil{
			aCoder.encodeObject(userpicHttpsUrl, forKey: "userpic_https_url")
		}
		if userpicUrl != nil{
			aCoder.encodeObject(userpicUrl, forKey: "userpic_url")
		}
		if usertype != nil{
			aCoder.encodeObject(usertype, forKey: "usertype")
		}

	}

}