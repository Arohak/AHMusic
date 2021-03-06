//
//  ActionSheetPickerViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/19/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ActionSheetPickerViewController: UIAlertController {
    
    var pickerView: AHPickerView!
    
    init(values: Array<String>, callback: PickerCallback) {
        super.init(nibName: nil, bundle: nil)
        
        title = nil
        message = "\n\n\n\n\n\n"
        addAction(UIAlertAction(title: "Close", style: .Cancel) { _ in })
        
        pickerView = AHPickerView(values: values, callback: callback)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(pickerView)
        pickerView.autoPinEdgeToSuperviewEdge(ALEdge.Top)
        pickerView.autoPinEdgeToSuperviewEdge(ALEdge.Bottom, withInset: 60)
        pickerView.autoAlignAxisToSuperviewAxis(ALAxis.Vertical)
        pickerView.autoSetDimension(.Height, toSize: ScreenSize.HEIGHT*0.25)
    }
}