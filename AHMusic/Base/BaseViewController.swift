//
//  BaseViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class BaseViewController: UIViewController {
    
    var pageIndex : Int = 0

    //MARK: - Create UIElements
    lazy var numberToolbar: UIToolbar = {
        let view = UIToolbar(frame: CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 44))
        view.items = [UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(doneNumberPad))]
        
        return view
    }()
    
    //MARK: - Actions
    func doneNumberPad() {
        self.view.endEditing(true)
    }
}
