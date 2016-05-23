//
//  UIHelper.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import SwiftLoader
import PKHUD
import ALThreeCircleSpinner

struct UIHelper {
    
    static func configurateApplicationApperance() {
        UIApplication.sharedApplication().statusBarHidden = false
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.translucent = false
        navBarAppearance.barStyle = .BlackTranslucent
        navBarAppearance.barTintColor = BLACK_59
        navBarAppearance.tintColor = WHITE
        navBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName: WHITE, NSFontAttributeName : FONT_NAVBAR]
    }

    static func showProgressHUD() {
        var config = SwiftLoader.Config()
        config.size = 100
        config.spinnerColor = WHITE
        config.backgroundColor = GRAY_164
        config.foregroundAlpha = 0.3
        SwiftLoader.setConfig(config)
        SwiftLoader.show(animated: true)
    }
    
    static func hideProgressHUD() {
        SwiftLoader.hide()
    }

    static func showHUD(message: String) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: message)
        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = true
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0);
    }
    
    static func showAlert(message: String) {
        let alertController = UIAlertController(title: "AHMusic", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        let vc = appDelegate.window!.rootViewController
        vc!.presentViewController(alertController, animated: true, completion: nil)
    }
    
    static func showSpinner() {
        ALThreeCircleSpinner.config()
        ALThreeCircleSpinner.show()
    }
    
    static func hideSpinner() {
        ALThreeCircleSpinner.hide()
    }
    
    static func root() -> UINavigationController {
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.window!.rootViewController as! UINavigationController
    }
//
//    class func shakeWithView(view: UIView) {
//        let shake = CABasicAnimation(keyPath: "position")
//        shake.duration = 0.1
//        shake.repeatCount = 2
//        shake.autoreverses = true
//        
//        let from_point = CGPointMake(view.center.x - 5, view.center.y)
//        let from_value = NSValue(CGPoint: from_point)
//        
//        let to_point = CGPointMake(view.center.x + 5, view.center.y)
//        let to_value = NSValue(CGPoint: to_point)
//        
//        shake.fromValue = from_value
//        shake.toValue = to_value
//        view.layer.addAnimation(shake, forKey: "position")
//    }
}