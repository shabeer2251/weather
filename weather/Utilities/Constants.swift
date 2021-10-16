//
//  Constants.swift
//  weather
//
//  Created by Muhammed Shabeer on 14/10/21.
//

import Foundation

enum LanguageCode: String {
    case english = "en"
    case spanish = "es"
    
    mutating func toggle() {
        switch self {
        case .english:
            self = .spanish
            
        case .spanish:
            self = .english
        }
    }
}

class Constants {
    public static var languageCode: LanguageCode = .english
    private static let apiAccessKey = "6a98e4948cc86e9d79a325b467144940"
    private static let baseUrl = "http://api.weatherstack.com/"
    
    static var getApiAccessKey: String {
        return apiAccessKey
    }
    
    static var getBaseUrl: String {
        return baseUrl
    }
}
