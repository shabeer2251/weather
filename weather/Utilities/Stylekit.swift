//
//  Stylekit.swift
//  weather
//
//  Created by Muhammed Shabeer on 15/10/21.
//

import UIKit

class StyleKit {
    
    static func applyRegularLabelStyle(label: UILabel, fontSize: CGFloat, color: UIColor = .darkText) {
        label.textColor = color
        label.font = UIFont.regularAppFont(of: fontSize)
    }
    
    static func applyMediumLabelStyle(label: UILabel, fontSize: CGFloat = 20, color: UIColor = .darkGray) {
        label.textColor = color
        label.font = UIFont.mediumAppFont(of: fontSize)
    }
    
    static func applyBoldLabelStyle(label: UILabel, fontSize: CGFloat, color: UIColor = .darkText) {
        label.textColor = color
        label.font = UIFont.boldAppFont(of: fontSize)
    }
    
    static func applyRoundCornersAndShadowAroundView(view: UIView, cornerRadius: CGFloat = 7.0, shadowColor: UIColor = .darkText, shadowRadius: CGFloat = 50.0, shadowOpacity: Float = 0.3, shadowOffset: CGSize = .zero) {
        view.layer.cornerRadius = cornerRadius
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowOffset = shadowOffset
        view.layer.masksToBounds = false
    }
   
}
