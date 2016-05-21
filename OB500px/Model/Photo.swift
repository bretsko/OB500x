//
//	Photo.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Photo : NSObject, NSCoding{

	var aperture : String!
	var camera : String!
	var category : Int!
	var collectionsCount : Int!
	var commentsCount : Int!
	var converted : Int!
	var convertedBits : Int!
	var createdAt : String!
	var cropVersion : Int!
	var descriptionField : AnyObject!
	var favoritesCount : Int!
	var focalLength : String!
	var forSale : Bool!
	var forSaleDate : AnyObject!
	var height : Int!
	var hiResUploaded : Int!
	var highestRating : Float!
	var highestRatingDate : String!
	var id : Int!
	var imageFormat : String!
	var imageUrl : String!
	var images : [Image]!
	var iso : String!
	var latitude : AnyObject!
	var lens : AnyObject!
	var licenseType : Int!
	var licensingRequested : Bool!
	var location : AnyObject!
	var longitude : AnyObject!
	var name : String!
	var nsfw : Bool!
	var positiveVotesCount : Int!
	var privacy : Bool!
	var profile : Bool!
	var rating : Float!
	var salesCount : Int!
	var shutterSpeed : String!
	var status : Int!
	var takenAt : String!
	var timesViewed : Int!
	var url : String!
	var user : User!
	var userId : Int!
	var votesCount : Int!
	var watermark : Bool!
	var width : Int!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json == nil{
			return
		}
		aperture = json["aperture"].stringValue
		camera = json["camera"].stringValue
		category = json["category"].intValue
		collectionsCount = json["collections_count"].intValue
		commentsCount = json["comments_count"].intValue
		converted = json["converted"].intValue
		convertedBits = json["converted_bits"].intValue
		createdAt = json["created_at"].stringValue
		cropVersion = json["crop_version"].intValue
		descriptionField = json["description"].stringValue
		favoritesCount = json["favorites_count"].intValue
		focalLength = json["focal_length"].stringValue
		forSale = json["for_sale"].boolValue
		forSaleDate = json["for_sale_date"].stringValue
		height = json["height"].intValue
		hiResUploaded = json["hi_res_uploaded"].intValue
		highestRating = json["highest_rating"].floatValue
		highestRatingDate = json["highest_rating_date"].stringValue
		id = json["id"].intValue
		imageFormat = json["image_format"].stringValue
		imageUrl = json["image_url"].stringValue
		images = [Image]()
		let imagesArray = json["images"].arrayValue
		for imagesJson in imagesArray{
			let value = Image(fromJson: imagesJson)
			images.append(value)
		}
		iso = json["iso"].stringValue
		latitude = json["latitude"].stringValue
		lens = json["lens"].stringValue
		licenseType = json["license_type"].intValue
		licensingRequested = json["licensing_requested"].boolValue
		location = json["location"].stringValue
		longitude = json["longitude"].stringValue
		name = json["name"].stringValue
		nsfw = json["nsfw"].boolValue
		positiveVotesCount = json["positive_votes_count"].intValue
		privacy = json["privacy"].boolValue
		profile = json["profile"].boolValue
		rating = json["rating"].floatValue
		salesCount = json["sales_count"].intValue
		shutterSpeed = json["shutter_speed"].stringValue
		status = json["status"].intValue
		takenAt = json["taken_at"].stringValue
		timesViewed = json["times_viewed"].intValue
		url = json["url"].stringValue
		let userJson = json["user"]
		if userJson != JSON.nullJSON{
			user = User(fromJson: userJson)
		}
		userId = json["user_id"].intValue
		votesCount = json["votes_count"].intValue
		watermark = json["watermark"].boolValue
		width = json["width"].intValue
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if aperture != nil{
			dictionary["aperture"] = aperture
		}
		if camera != nil{
			dictionary["camera"] = camera
		}
		if category != nil{
			dictionary["category"] = category
		}
		if collectionsCount != nil{
			dictionary["collections_count"] = collectionsCount
		}
		if commentsCount != nil{
			dictionary["comments_count"] = commentsCount
		}
		if converted != nil{
			dictionary["converted"] = converted
		}
		if convertedBits != nil{
			dictionary["converted_bits"] = convertedBits
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if cropVersion != nil{
			dictionary["crop_version"] = cropVersion
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if favoritesCount != nil{
			dictionary["favorites_count"] = favoritesCount
		}
		if focalLength != nil{
			dictionary["focal_length"] = focalLength
		}
		if forSale != nil{
			dictionary["for_sale"] = forSale
		}
		if forSaleDate != nil{
			dictionary["for_sale_date"] = forSaleDate
		}
		if height != nil{
			dictionary["height"] = height
		}
		if hiResUploaded != nil{
			dictionary["hi_res_uploaded"] = hiResUploaded
		}
		if highestRating != nil{
			dictionary["highest_rating"] = highestRating
		}
		if highestRatingDate != nil{
			dictionary["highest_rating_date"] = highestRatingDate
		}
		if id != nil{
			dictionary["id"] = id
		}
		if imageFormat != nil{
			dictionary["image_format"] = imageFormat
		}
		if imageUrl != nil{
			dictionary["image_url"] = imageUrl
		}
		if images != nil{
			var dictionaryElements = [NSDictionary]()
			for imagesElement in images {
				dictionaryElements.append(imagesElement.toDictionary())
			}
			dictionary["images"] = dictionaryElements
		}
		if iso != nil{
			dictionary["iso"] = iso
		}
		if latitude != nil{
			dictionary["latitude"] = latitude
		}
		if lens != nil{
			dictionary["lens"] = lens
		}
		if licenseType != nil{
			dictionary["license_type"] = licenseType
		}
		if licensingRequested != nil{
			dictionary["licensing_requested"] = licensingRequested
		}
		if location != nil{
			dictionary["location"] = location
		}
		if longitude != nil{
			dictionary["longitude"] = longitude
		}
		if name != nil{
			dictionary["name"] = name
		}
		if nsfw != nil{
			dictionary["nsfw"] = nsfw
		}
		if positiveVotesCount != nil{
			dictionary["positive_votes_count"] = positiveVotesCount
		}
		if privacy != nil{
			dictionary["privacy"] = privacy
		}
		if profile != nil{
			dictionary["profile"] = profile
		}
		if rating != nil{
			dictionary["rating"] = rating
		}
		if salesCount != nil{
			dictionary["sales_count"] = salesCount
		}
		if shutterSpeed != nil{
			dictionary["shutter_speed"] = shutterSpeed
		}
		if status != nil{
			dictionary["status"] = status
		}
		if takenAt != nil{
			dictionary["taken_at"] = takenAt
		}
		if timesViewed != nil{
			dictionary["times_viewed"] = timesViewed
		}
		if url != nil{
			dictionary["url"] = url
		}
		if user != nil{
			dictionary["user"] = user.toDictionary()
		}
		if userId != nil{
			dictionary["user_id"] = userId
		}
		if votesCount != nil{
			dictionary["votes_count"] = votesCount
		}
		if watermark != nil{
			dictionary["watermark"] = watermark
		}
		if width != nil{
			dictionary["width"] = width
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         aperture = aDecoder.decodeObjectForKey("aperture") as? String
         camera = aDecoder.decodeObjectForKey("camera") as? String
         category = aDecoder.decodeObjectForKey("category") as? Int
         collectionsCount = aDecoder.decodeObjectForKey("collections_count") as? Int
         commentsCount = aDecoder.decodeObjectForKey("comments_count") as? Int
         converted = aDecoder.decodeObjectForKey("converted") as? Int
         convertedBits = aDecoder.decodeObjectForKey("converted_bits") as? Int
         createdAt = aDecoder.decodeObjectForKey("created_at") as? String
         cropVersion = aDecoder.decodeObjectForKey("crop_version") as? Int
         descriptionField = aDecoder.decodeObjectForKey("description") as? AnyObject
         favoritesCount = aDecoder.decodeObjectForKey("favorites_count") as? Int
         focalLength = aDecoder.decodeObjectForKey("focal_length") as? String
         forSale = aDecoder.decodeObjectForKey("for_sale") as? Bool
         forSaleDate = aDecoder.decodeObjectForKey("for_sale_date") as? AnyObject
         height = aDecoder.decodeObjectForKey("height") as? Int
         hiResUploaded = aDecoder.decodeObjectForKey("hi_res_uploaded") as? Int
         highestRating = aDecoder.decodeObjectForKey("highest_rating") as? Float
         highestRatingDate = aDecoder.decodeObjectForKey("highest_rating_date") as? String
         id = aDecoder.decodeObjectForKey("id") as? Int
         imageFormat = aDecoder.decodeObjectForKey("image_format") as? String
         imageUrl = aDecoder.decodeObjectForKey("image_url") as? String
         images = aDecoder.decodeObjectForKey("images") as? [Image]
         iso = aDecoder.decodeObjectForKey("iso") as? String
         latitude = aDecoder.decodeObjectForKey("latitude") as? AnyObject
         lens = aDecoder.decodeObjectForKey("lens") as? AnyObject
         licenseType = aDecoder.decodeObjectForKey("license_type") as? Int
         licensingRequested = aDecoder.decodeObjectForKey("licensing_requested") as? Bool
         location = aDecoder.decodeObjectForKey("location") as? AnyObject
         longitude = aDecoder.decodeObjectForKey("longitude") as? AnyObject
         name = aDecoder.decodeObjectForKey("name") as? String
         nsfw = aDecoder.decodeObjectForKey("nsfw") as? Bool
         positiveVotesCount = aDecoder.decodeObjectForKey("positive_votes_count") as? Int
         privacy = aDecoder.decodeObjectForKey("privacy") as? Bool
         profile = aDecoder.decodeObjectForKey("profile") as? Bool
         rating = aDecoder.decodeObjectForKey("rating") as? Float
         salesCount = aDecoder.decodeObjectForKey("sales_count") as? Int
         shutterSpeed = aDecoder.decodeObjectForKey("shutter_speed") as? String
         status = aDecoder.decodeObjectForKey("status") as? Int
         takenAt = aDecoder.decodeObjectForKey("taken_at") as? String
         timesViewed = aDecoder.decodeObjectForKey("times_viewed") as? Int
         url = aDecoder.decodeObjectForKey("url") as? String
         user = aDecoder.decodeObjectForKey("user") as? User
         userId = aDecoder.decodeObjectForKey("user_id") as? Int
         votesCount = aDecoder.decodeObjectForKey("votes_count") as? Int
         watermark = aDecoder.decodeObjectForKey("watermark") as? Bool
         width = aDecoder.decodeObjectForKey("width") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if aperture != nil{
			aCoder.encodeObject(aperture, forKey: "aperture")
		}
		if camera != nil{
			aCoder.encodeObject(camera, forKey: "camera")
		}
		if category != nil{
			aCoder.encodeObject(category, forKey: "category")
		}
		if collectionsCount != nil{
			aCoder.encodeObject(collectionsCount, forKey: "collections_count")
		}
		if commentsCount != nil{
			aCoder.encodeObject(commentsCount, forKey: "comments_count")
		}
		if converted != nil{
			aCoder.encodeObject(converted, forKey: "converted")
		}
		if convertedBits != nil{
			aCoder.encodeObject(convertedBits, forKey: "converted_bits")
		}
		if createdAt != nil{
			aCoder.encodeObject(createdAt, forKey: "created_at")
		}
		if cropVersion != nil{
			aCoder.encodeObject(cropVersion, forKey: "crop_version")
		}
		if descriptionField != nil{
			aCoder.encodeObject(descriptionField, forKey: "description")
		}
		if favoritesCount != nil{
			aCoder.encodeObject(favoritesCount, forKey: "favorites_count")
		}
		if focalLength != nil{
			aCoder.encodeObject(focalLength, forKey: "focal_length")
		}
		if forSale != nil{
			aCoder.encodeObject(forSale, forKey: "for_sale")
		}
		if forSaleDate != nil{
			aCoder.encodeObject(forSaleDate, forKey: "for_sale_date")
		}
		if height != nil{
			aCoder.encodeObject(height, forKey: "height")
		}
		if hiResUploaded != nil{
			aCoder.encodeObject(hiResUploaded, forKey: "hi_res_uploaded")
		}
		if highestRating != nil{
			aCoder.encodeObject(highestRating, forKey: "highest_rating")
		}
		if highestRatingDate != nil{
			aCoder.encodeObject(highestRatingDate, forKey: "highest_rating_date")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if imageFormat != nil{
			aCoder.encodeObject(imageFormat, forKey: "image_format")
		}
		if imageUrl != nil{
			aCoder.encodeObject(imageUrl, forKey: "image_url")
		}
		if images != nil{
			aCoder.encodeObject(images, forKey: "images")
		}
		if iso != nil{
			aCoder.encodeObject(iso, forKey: "iso")
		}
		if latitude != nil{
			aCoder.encodeObject(latitude, forKey: "latitude")
		}
		if lens != nil{
			aCoder.encodeObject(lens, forKey: "lens")
		}
		if licenseType != nil{
			aCoder.encodeObject(licenseType, forKey: "license_type")
		}
		if licensingRequested != nil{
			aCoder.encodeObject(licensingRequested, forKey: "licensing_requested")
		}
		if location != nil{
			aCoder.encodeObject(location, forKey: "location")
		}
		if longitude != nil{
			aCoder.encodeObject(longitude, forKey: "longitude")
		}
		if name != nil{
			aCoder.encodeObject(name, forKey: "name")
		}
		if nsfw != nil{
			aCoder.encodeObject(nsfw, forKey: "nsfw")
		}
		if positiveVotesCount != nil{
			aCoder.encodeObject(positiveVotesCount, forKey: "positive_votes_count")
		}
		if privacy != nil{
			aCoder.encodeObject(privacy, forKey: "privacy")
		}
		if profile != nil{
			aCoder.encodeObject(profile, forKey: "profile")
		}
		if rating != nil{
			aCoder.encodeObject(rating, forKey: "rating")
		}
		if salesCount != nil{
			aCoder.encodeObject(salesCount, forKey: "sales_count")
		}
		if shutterSpeed != nil{
			aCoder.encodeObject(shutterSpeed, forKey: "shutter_speed")
		}
		if status != nil{
			aCoder.encodeObject(status, forKey: "status")
		}
		if takenAt != nil{
			aCoder.encodeObject(takenAt, forKey: "taken_at")
		}
		if timesViewed != nil{
			aCoder.encodeObject(timesViewed, forKey: "times_viewed")
		}
		if url != nil{
			aCoder.encodeObject(url, forKey: "url")
		}
		if user != nil{
			aCoder.encodeObject(user, forKey: "user")
		}
		if userId != nil{
			aCoder.encodeObject(userId, forKey: "user_id")
		}
		if votesCount != nil{
			aCoder.encodeObject(votesCount, forKey: "votes_count")
		}
		if watermark != nil{
			aCoder.encodeObject(watermark, forKey: "watermark")
		}
		if width != nil{
			aCoder.encodeObject(width, forKey: "width")
		}

	}

}