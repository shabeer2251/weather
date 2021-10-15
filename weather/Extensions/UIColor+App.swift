//
//  UIColor+App.swift
//  weather
//
//  Created by Muhammed Shabeer on 15/10/21.
//

import UIKit

extension UIColor {
    static var appBackground: UIColor {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
    }
    
    static var appContentBox: UIColor {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }
    }
    
    static var appLabel: UIColor {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
    }
    
}
