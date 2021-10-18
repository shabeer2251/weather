//
//  String+Custom.swift
//  weather
//
//  Created by Muhammed Shabeer on 15/10/21.
//

import Foundation

extension String {
    var withoutSpaces: String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    var localized: String {
        guard let path = Bundle.main.path(forResource: Constants.languageCode.rawValue, ofType: "lproj"), let bundle = Bundle(path: path) else { return self }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
