//
//  SlideViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.


class SlideViewController: SlideMenuController  {
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
    }

    //MARK: -  Private Methods
    private func baseConfig() {
        SlideMenuOptions.leftViewWidth = 300
        SlideMenuOptions.hideStatusBar = false
        addLeftBarButtonWithImage(UIImage(named:"img_slide_menu")!)
        delegate = self
    }
    
    private func configureNavigationBar() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        menuButton.setImage(UIImage(named:"img_slide_menu"), forState: .Normal)
        menuButton.setImage(UIImage(named: "img_slide_back"), forState: .Selected)
        menuButton.imageEdgeInsets = UIEdgeInsetsZero
        menuButton.addTarget(self, action: #selector(openMenu(_:)), forControlEvents: .TouchUpInside)
        let leftMenuItem = UIBarButtonItem(customView: menuButton)
        
        self.navigationItem.setLeftBarButtonItem(leftMenuItem, animated: true)
    }
    
    //MARK: -  Actions
    func openMenu(sender: UIButton) {
        sender.selected = !sender.selected
        self.toggleLeft()
    }
}

extension SlideViewController: SlideMenuControllerDelegate {

    func leftWillOpen() {
        print("Open")
    }
    
    func leftWillClose() {
        print("Close")
    }
}
