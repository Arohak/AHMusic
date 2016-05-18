//
//  SlideViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.

//MARK: - class SlideViewController -
class SlideViewController: SlideMenuController {
    
    var output: CategoryViewOutput!
    var tab: TabViewController!
    var isAnimation = true
    
    lazy var textField: AHTextField = {
        let view = AHTextField(frame: CGRect(x: 0, y: 0, width: ScreenSize.WIDTH - 2*CA_ICON_SIZE, height: 25))
        view.backgroundColor = WHITE
        view.returnKeyType = .Search
        view.alpha = 0
        view.delegate = self
        
        return view
    }()
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: CGRectZero)
        view.backgroundColor = WHITE
        view.hidden = true
        view.alpha = 0
        
        return view
    }()
    
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
    
    //MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
    }

    //MARK: -  Private Methods -
    private func baseConfig() {
        configureNavigationBar()
        
        self.view.backgroundColor = WHITE
        SlideMenuOptions.leftViewWidth = ScreenSize.WIDTH*0.75
        SlideMenuOptions.hideStatusBar = false
        delegate = self
        
        let main = mainViewController as! CategoryViewController
        self.output = main.output as! CategoryPresenter
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "AHMusic"
        navigationItem.setLeftBarButtonItem(leftItem, animated: false)
        navigationItem.setRightBarButtonItem(rightItem, animated: false)
    }
    
    //MARK: -  Actions -
    func openMenu() {
        toggleLeft()
    }
    
    func openSearch() {
        textFieldAnimation()
    }
    
    //MARK: -  Animation -
    func textFieldAnimation() {
        if isAnimation {
            UIView.animateWithDuration(0.5, animations: {
                self.navigationItem.titleView = self.textField
                self.textField.becomeFirstResponder()
                self.textField.alpha = 1
                
                
                }, completion: { state in
                    self.isAnimation = !self.isAnimation
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                self.textField.resignFirstResponder()
                self.textField.alpha = 0

                }, completion: { state in
                    self.navigationItem.titleView = nil
                    self.isAnimation = !self.isAnimation
            })
        }
    }
}

//MARK: - extension for SlideMenuControllerDelegate -
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

//MARK: - extension for UITextFieldDelegate -
extension SlideViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField.text!.characters.count < 3 {
            UIHelper.showHUD("search text min 3 simbol")
        } else {
            if let tab = tab where !(tab.selectedPresenter is StationPresenter) {
                let presenter = tab.selectedPresenter
                presenter.keyword = textField.text!
                let output = tab.selectedPresenter as! BaseViewOutput
                output.viewIsReady()
            } else {
                let item = Category(data: JSON(["name" : textField.text!]))
                output.viewIsSelectItem(item)
            }
            
            textFieldAnimation()
        }
        
        return true
    }
}
