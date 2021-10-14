//
//  Weather.swift
//  weather
//
//  Created by Muhammed Shabeer on 15/10/21.
//

import Foundation

struct Weather: Codable {
    var location: Location?
    var current: Current?
    
    enum CodingKeys: String, CodingKey {
        case location = "location"
        case current = "current"
    }
    
}


struct Location: Codable {
    var name: String?
    var country: String?
    var region: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case country = "country"
        case region = "region"
    }
}


struct Current: Codable {
    var observationTime: String?
    var temperature: Int?
    var weatherDescriptions: [String]?
   // var weatherIcons: [String]?
    
    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case temperature = "temperature"
        case weatherDescriptions = "weather_descriptions"
      //  case weatherIcons = "weather_icons"
    }
    
}
