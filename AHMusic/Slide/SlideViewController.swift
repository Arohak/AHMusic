//
//  SlideViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.


class SlideViewController: SlideMenuController  {
    
    lazy var leftItem: UIBarButtonItem = {
        let menuButton = AHButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        menuButton.setImage(UIImage(named:"img_slide_menu"), forState: .Normal)
        menuButton.setImage(UIImage(named: "img_slide_back"), forState: .Selected)
        menuButton.imageEdgeInsets = UIEdgeInsetsZero
        menuButton.addTarget(self, action: #selector(SlideViewController.openMenu), forControlEvents: .TouchUpInside)
        let item = UIBarButtonItem(customView: menuButton)
        
        return item
    }()
    
    lazy var rightItem: UIBarButtonItem = {
        let searchButton = AHButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        searchButton.setImage(UIImage(named:"img_slide_search"), forState: .Normal)
        searchButton.imageEdgeInsets = UIEdgeInsetsZero
        searchButton.addTarget(self, action: #selector(SlideViewController.openSearch), forControlEvents: .TouchUpInside)
        let item = UIBarButtonItem(customView: searchButton)
        
        return item
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
    }

    //MARK: -  Private Methods
    private func baseConfig() {
        configureNavigationBar()
        
        self.view.backgroundColor = WHITE
        SlideMenuOptions.leftViewWidth = 300
        SlideMenuOptions.hideStatusBar = false
//        addLeftBarButtonWithImage(UIImage(named:"img_slide_menu")!)
        delegate = self
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "AHMusic"
        navigationItem.setLeftBarButtonItem(leftItem, animated: false)
        navigationItem.setRightBarButtonItem(rightItem, animated: false)
    }
    
    //MARK: -  Actions
    func openMenu() {
        toggleLeft()
    }
    
    func openSearch() {
        
    }
}

extension SlideViewController: SlideMenuControllerDelegate {

    func leftWillOpen() {
        let menuButton = navigationItem.leftBarButtonItem?.customView as! UIButton
        menuButton.selected = true
    }
    
    func leftWillClose() {
        let menuButton = navigationItem.leftBarButtonItem?.customView as! UIButton
        menuButton.selected = false
    }
}
