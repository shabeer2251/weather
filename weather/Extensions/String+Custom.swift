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
}
