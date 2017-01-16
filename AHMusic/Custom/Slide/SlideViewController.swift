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
        view.returnKeyType = .search
        view.alpha = 0
        view.delegate = self
        
        return view
    }()
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: CGRect.zero)
        view.backgroundColor = WHITE
        view.isHidden = true
        view.alpha = 0
        
        return view
    }()
    
    lazy var leftItem: UIBarButtonItem = {
        let menuButton = AHButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        menuButton.setImage(UIImage(named:"img_slide_menu"), for: .normal)
        menuButton.setImage(UIImage(named: "img_slide_back"), for: .selected)
        menuButton.imageEdgeInsets = UIEdgeInsets.zero
        menuButton.addTarget(self, action: #selector(SlideViewController.openMenu), for: .touchUpInside)
        let item = UIBarButtonItem(customView: menuButton)
        
        return item
    }()
    
    lazy var rightItem: UIBarButtonItem = {
        let searchButton = AHButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        searchButton.setImage(UIImage(named:"img_slide_search"), for: .normal)
        searchButton.imageEdgeInsets = UIEdgeInsets.zero
        searchButton.addTarget(self, action: #selector(SlideViewController.openSearch), for: .touchUpInside)
        let item = UIBarButtonItem(customView: searchButton)
        
        return item
    }()
    
    //MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
    }

    //MARK: -  Private Methods -
    fileprivate func baseConfig() {
        configureNavigationBar()
        
        self.view.backgroundColor = BLACK_59
        SlideMenuOptions.leftViewWidth = WIDTH
        SlideMenuOptions.hideStatusBar = false
        delegate = self
        
        let main = mainViewController as! CategoryViewController
        self.output = main.output as! CategoryPresenter
    }
    
    fileprivate func configureNavigationBar() {
        navigationItem.title = "AHMusic"
        navigationItem.setLeftBarButton(leftItem, animated: false)
        navigationItem.setRightBarButton(rightItem, animated: false)
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
            UIView.animate(withDuration: 0.5, animations: {
                self.navigationItem.titleView = self.textField
                self.textField.becomeFirstResponder()
                self.textField.alpha = 1
                
                
                }, completion: { state in
                    self.isAnimation = !self.isAnimation
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
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
        menuButton.isSelected = true
    }
    
    func leftWillClose() {
        let menuButton = navigationItem.leftBarButtonItem?.customView as! UIButton
        menuButton.isSelected = false
    }
}

//MARK: - extension for UITextFieldDelegate -
extension SlideViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.text!.characters.count < 3 {
            UIHelper.showHUD("search text min 3 simbol")
        } else {
            
            if let slide = UIHelper.root().visibleViewController as? SlideViewController, slide.mainViewController is FavoriteViewController {
                let favorite = slide.mainViewController as! FavoriteViewController
                favorite.output.search(textField.text!)
                textFieldAnimation()

                return true
            }
            
            if let slide = UIHelper.root().visibleViewController as? SlideViewController, slide.mainViewController is DownloadViewController {
                let download = slide.mainViewController as! DownloadViewController
                download.output.search(textField.text!)
                textFieldAnimation()
                
                return true
            }
            
            if let tab = tab, !(tab.selectedViewController is StationViewController) {
                let vc = tab.selectedViewController
                vc?.keyword = textField.text!
                vc?.refresh()
            } else {
                let item = Category(data: JSON(["name" : textField.text!]))
                output.viewIsSelectItem(item)
            }
            
            textFieldAnimation()
        }
        
        return true
    }
}
