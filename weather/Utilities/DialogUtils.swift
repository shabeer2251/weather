//
//  DialogUtils.swift
//  weather
//
//  Created by Muhammed Shabeer on 15/10/21.
//

import UIKit
import SVProgressHUD

class DialogUtils {
    static func showLoading() {
        SVProgressHUD.dismiss()
        SVProgressHUD.show(withStatus: "Loading...")
      //  SVProgressHUD.setContainerView(containerView)
        SVProgressHUD.setDefaultMaskType(.black)
    }
    
    static func hideLoading() {
        SVProgressHUD.dismiss()
    }
}
