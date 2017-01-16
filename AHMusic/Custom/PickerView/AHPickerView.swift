//
//  AHPickerView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/19/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class AHPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    fileprivate var callback: PickerCallback?
    
    var closeTimer = Timer()
    var values = Array<String>()
    var indexPath: NSIndexPath!
    
    //MARK: - Initilize -
    init(values: Array<String>, callback: @escaping PickerCallback) {
        super.init(frame: CGRect.zero)
        
        delegate = self
        dataSource = self
        clipsToBounds = true
        layer.cornerRadius = 5.0
        
        self.values = values
        self.callback = callback
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions methods
    func closePopUp() {
        let nav = appDelegate.window!.rootViewController! as! UINavigationController
        if let vc = nav.presentedViewController {
            vc.dismiss(animated: true, completion: nil)
        }
        closeTimer.invalidate()
    }
    
    //MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return values[row]
    }
    
    //MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callback?(values[row])
        
        closeTimer.invalidate()
        closeTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(closePopUp), userInfo: nil, repeats: true)
    }
}
