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
    
    static func showMiniPlayer(index: Int, tracks: Array<Track>, isOffline: Bool = false) {
        if let miniPlayerView = appDelegate.miniPlayerView {
            miniPlayerView.player.isOffline = isOffline
            miniPlayerView.setTrackers(index, items: tracks)
        } else {
            let view = MiniPlayerViewRoot(index: index, items: tracks, isOffline: isOffline)
            appDelegate.miniPlayerView = view

            appDelegate.window!.addSubview(view)
            view.autoPinEdgeToSuperviewEdge(.Left)
            view.autoPinEdgeToSuperviewEdge(.Right)
            view.autoPinEdgeToSuperviewEdge(.Bottom)
            view.autoSetDimension(.Height, toSize: TD_BTN_SIZE*1.5)
        }
    }
    
    static func closeMiniPlayer() {
        if let miniPlayerView = appDelegate.miniPlayerView {
            miniPlayerView.removeFromSuperview()
            miniPlayerView.player.stop()
            appDelegate.miniPlayerView = nil
        }
    }
    static func isValidTextField(field: UITextField) -> Bool {
        var isValid = false
        let kText = field.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        !(kText == "") ? isValid = true : shakeWithView(field)
        
        return isValid;
    }
    
    static func isValidEmail(field: UITextField) -> Bool {
        var isValid = false
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let email = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        email.evaluateWithObject(field.text) ? isValid = true : shakeWithView(field)
        
        return isValid
    }
    
    static func isValidPassword(field: UITextField) -> Bool {
        var isValid = false
        let kText = field.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        (kText.characters.count >= 2 && kText != "") ? isValid = true : shakeWithView(field)

        return isValid
    }
    
    static func isValidPasswordsEqual(fieldOne: UITextField, fieldTwo: UITextField) -> Bool {
        var isValid = false
        let kPassword = fieldOne.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let kConfirmPassword = fieldTwo.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if kPassword == kConfirmPassword && kPassword != "" && kConfirmPassword != "" && kPassword.characters.count > 0 && kConfirmPassword.characters.count > 0 {
            isValid = true
        } else {
            shakeWithView(fieldOne)
            shakeWithView(fieldTwo)
        }
        
        return isValid
    }

    static func shakeWithView(view: UIView) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let from_point = CGPointMake(view.center.x - 5, view.center.y)
        let from_value = NSValue(CGPoint: from_point)
        
        let to_point = CGPointMake(view.center.x + 5, view.center.y)
        let to_value = NSValue(CGPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        view.layer.addAnimation(shake, forKey: "position")
    }
}