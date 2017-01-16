//
//  SignInViewController.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SignInViewController -
class SignInViewController: UIViewController {
    
    var output: SignInViewOutput!
    var cells = Array<FieldCell>()
    
    //MARK: - Create UIElements -
    lazy var signInView: SignInView = {
        let view = SignInView()
        view.tableView.dataSource = self
        view.tableView.delegate = self

        return view
    }()
    
    lazy var headerView: SIHeaderView = {
        let view = SIHeaderView()

        return view
    }()
    
    lazy var footerView: SIFooterView = {
        let view = SIFooterView()

        return view
    }()
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
        baseConfig()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Private Methods -
    fileprivate func baseConfig() {
        self.view = signInView
        
        self.title = "Sign In"
        configurateTableViewCells()
        
        NotificationCenter.default.addObserver(self, selector: #selector(SignInViewController.keyboardWillChangeFrame(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    fileprivate func configurateTableViewCells() {
        let placeholders = ["Email", "Password"]
        let keyTypes = [UIReturnKeyType.next, UIReturnKeyType.go]
        let keyboardTypes = [UIKeyboardType.emailAddress, UIKeyboardType.default]
        let capitalizationTypes = [UITextAutocapitalizationType.none, UITextAutocapitalizationType.none]
        let secureTextEntrys = [false, true]
        
        for i in 0..<placeholders.count {
            let signInCell = FieldCell()
            signInCell.selectionStyle = .none
            signInCell.cellContentView.authTextField.autocapitalizationType = capitalizationTypes[i]
            signInCell.cellContentView.authTextField.isSecureTextEntry = secureTextEntrys[i]
            signInCell.cellContentView.authTextField.keyboardType = keyboardTypes[i]
            signInCell.cellContentView.authTextField.placeholder = placeholders[i]
            signInCell.cellContentView.authTextField.returnKeyType = keyTypes[i]
            signInCell.cellContentView.authTextField.delegate = self
            signInCell.cellContentView.authTextField.tag = i
            
            cells.append(signInCell)
        }
    }
    
    fileprivate func isValidInputParams() -> Bool {
        var isValid = true
        if !UIHelper.isValidEmail(field: cells[0].cellContentView.authTextField) {
            isValid = false
        }
        if !UIHelper.isValidPassword(field: cells[1].cellContentView.authTextField) {
            isValid = false
        }
        
        return isValid
    }
    
    //MARK: - Actions -
    func signIn() {
        if isValidInputParams() {
            let email = cells[0].cellContentView.authTextField.text!
            let password = cells[1].cellContentView.authTextField.text!
            let json = JSON(["email" : email, "password" : password])

            output.signinButtonClicked(json)
        }
    }
    
    //MARK: - Keyboard notifications -
    func keyboardWillChangeFrame(_ notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let animationDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber) as! TimeInterval
            let height = keyboardFrame.origin.y
            
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: animationDuration, animations: { _ in
                self.signInView.heighTBLConstraint.constant = height - NAV_HEIGHT
                self.view.layoutIfNeeded()
            })
        }
    }
}

//MARK: - extension for SignInViewInput -
extension SignInViewController: SignInViewInput {
    
    func setupInitialState() {
        
    }
}

//MARK: - extension for UITableView -
extension SignInViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return cells[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return AU_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return SI_LOGO_SIZE*1.5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return (AU_BTN_HEIGHT + SI_OFFSET)*3 + SI_OFFSET*2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footerView.signInButton.addTarget(self, action: #selector(SignInViewController.signIn), for: UIControlEvents.touchUpInside)
        footerView.facebookButton.addTarget(self, action: #selector(SignInViewController.signIn), for: UIControlEvents.touchUpInside)
        footerView.googleButton.addTarget(self, action: #selector(SignInViewController.signIn), for: UIControlEvents.touchUpInside)

        return footerView
    }
}

//MARK: - extension for UITextField -
extension SignInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            cells[1].cellContentView.authTextField.becomeFirstResponder()
            signInView.tableView.scrollToRow(at: IndexPath(row: 1, section: 0), at: .none, animated: true)
        } else {
            textField.resignFirstResponder()
            signIn()
        }
        return true
    }
}
