//
//  UIHelper.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import PKHUD

struct UIHelper {
    
    static func configurateApplicationApperance() {
        UIApplication.shared.statusBarStyle = .lightContent
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.isTranslucent = false
        navBarAppearance.barStyle = .blackTranslucent
        navBarAppearance.barTintColor = BLACK_59
        navBarAppearance.tintColor = WHITE
        navBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName: WHITE, NSFontAttributeName : FONT_NAVBAR]
    }

    static func showProgressHUD() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        HUD.show(.progress)
    }
    
    static func hideProgressHUD() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        HUD.hide()
    }

    static func showHUD(_ message: String) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: message)
        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = true
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    static func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "AHMusic", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        let vc = appDelegate.window!.rootViewController
        vc!.present(alertController, animated: true, completion: nil)
    }

    static func root() -> UINavigationController {
        return appDelegate.window!.rootViewController as! UINavigationController
    }
    
    static func showMiniPlayer(_ index: Int, tracks: Array<Track>, isOffline: Bool = false) {
        if let miniPlayerView = appDelegate.miniPlayerView {
            miniPlayerView.player.isOffline = isOffline
            miniPlayerView.setTrackers(index, tracks: tracks)

        } else {
            let view = MiniPlayerViewRoot(index: index, tracks: tracks, isOffline: isOffline)
            appDelegate.miniPlayerView = view

            appDelegate.window!.addSubview(view)
            view.autoPinEdge(toSuperviewEdge: .left)
            view.autoPinEdge(toSuperviewEdge: .right)
            view.autoPinEdge(toSuperviewEdge: .bottom)
            view.autoSetDimension(.height, toSize: PL_HEIGHT)
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
        let kText = field.text?.trimmingCharacters(in: .whitespaces)
        !(kText == "") ? isValid = true : shakeWithView(view: field)
        
        return isValid
    }
    
    static func isValidEmail(field: UITextField) -> Bool {
        var isValid = false
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let email = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        email.evaluate(with: field.text) ? isValid = true : shakeWithView(view: field)
        
        return isValid
    }
    
    static func isValidPassword(field: UITextField) -> Bool {
        var isValid = false
        let kText = field.text?.trimmingCharacters(in: .whitespaces)
        (kText!.characters.count >= 2 && kText != "") ? isValid = true : shakeWithView(view: field)

        return isValid
    }
    
    static func isValidPasswordsEqual(passwordField: UITextField, confirmPasswordField: UITextField) -> Bool {
        var isValid = false
        let kPassword = passwordField.text!.trimmingCharacters(in: .whitespaces)
        let kConfirmPassword = confirmPasswordField.text!.trimmingCharacters(in: .whitespaces)
        if kPassword == kConfirmPassword && kPassword != "" && kConfirmPassword != "" && kPassword.characters.count > 3 && kConfirmPassword.characters.count > 3 {
            isValid = true
        } else {
            shakeWithView(view: passwordField)
            shakeWithView(view: confirmPasswordField)
        }
        
        return isValid
    }

    static func shakeWithView(view: UIView) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let from_point = CGPoint(x: view.center.x - 5, y: view.center.y)
        let from_value = NSValue(cgPoint: from_point)
        
        let to_point = CGPoint(x: view.center.x + 5, y: view.center.y)
        let to_value = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        view.layer.add(shake, forKey: "position")
    }
}
