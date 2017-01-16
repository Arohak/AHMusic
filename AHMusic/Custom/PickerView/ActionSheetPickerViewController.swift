//
//  ActionSheetPickerViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/19/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ActionSheetPickerViewController: UIAlertController {
    
    var pickerView: AHPickerView!
    
    init(values: Array<String>, callback: @escaping PickerCallback) {
        super.init(nibName: nil, bundle: nil)
        
        title = nil
        message = "\n\n\n\n\n\n"
        addAction(UIAlertAction(title: "Close", style: .cancel) { _ in })
        
        pickerView = AHPickerView(values: values, callback: callback)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(pickerView)
        pickerView.autoPinEdge(toSuperviewEdge: .top)
        pickerView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 60)
        pickerView.autoAlignAxis(toSuperviewAxis: .vertical)
        pickerView.autoSetDimension(.height, toSize: ScreenSize.HEIGHT*0.25)
    }
}
