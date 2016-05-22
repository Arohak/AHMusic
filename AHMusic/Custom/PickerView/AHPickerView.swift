//
//  AHPickerView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/19/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class AHPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var callback: PickerCallback?
    
    var closeTimer = NSTimer()
    var values = Array<String>()
    var indexPath: NSIndexPath!
    
    //MARK: - Initilize -
    init(values: Array<String>, callback: PickerCallback) {
        super.init(frame: CGRectZero)
        
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
            vc.dismissViewControllerAnimated(true, completion: nil)
        }
        closeTimer.invalidate()
    }
    
    //MARK: - UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return values.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return values[row]
    }
    
    //MARK: - UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callback?(value: values[row])
        
        closeTimer.invalidate()
        closeTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(closePopUp), userInfo: AnyObject?(), repeats: true)
    }
}