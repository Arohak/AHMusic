//
//  PopupPickerViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/19/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class PopupPickerViewController: UIViewController {
    
    var pickerView: AHPickerView!
    
    init(sender: UIButton, values: Array<String>, callback: @escaping PickerCallback) {
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .popover
        popoverPresentationController?.permittedArrowDirections = .any
        popoverPresentationController?.backgroundColor = WHITE
        popoverPresentationController?.sourceView = sender
        preferredContentSize = CGSize(width: 300, height: 200)
        let senderSize = CGSize(width: sender.frame.size.width, height: sender.frame.size.height)
        popoverPresentationController?.sourceRect = CGRect(x: senderSize.width/2, y: senderSize.height/2, width: 0, height: 0)
        
        pickerView = AHPickerView(values: values, callback: callback)
        pickerView.clipsToBounds = true;
        pickerView.layer.cornerRadius = 5;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(pickerView)
        pickerView.autoPinEdgesToSuperviewEdges()
        pickerView.backgroundColor = WHITE
    }
}
