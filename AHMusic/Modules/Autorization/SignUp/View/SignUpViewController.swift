//
//  SignUpViewController.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SignUpViewController -
class SignUpViewController: UIViewController {

    var output: SignUpViewOutput!
    var cells = Array<FieldCell>()
    
    //MARK: - Create UIElements -
    lazy var signUpView: SignUpView = {
        let view = SignUpView()
        view.tableView.dataSource = self
        view.tableView.delegate = self
        
        return view
    }()
    
    lazy var headerView: SUHeaderView = {
        let view = SUHeaderView()
        
        return view
    }()
    
    lazy var footerView: SUFooterView = {
        let view = SUFooterView()
        
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
        self.view = signUpView
        
        self.title = "Sign Up"
        configurateTableViewCells()
        
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpViewController.keyboardWillChangeFrame(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    fileprivate func configurateTableViewCells() {
        let placeholders = ["Full Name", "Email", "Password", "Confirm Password"]
        let keyTypes = [UIReturnKeyType.next, UIReturnKeyType.next, UIReturnKeyType.next, UIReturnKeyType.go]
        let keyboardTypes = [UIKeyboardType.default, UIKeyboardType.emailAddress, UIKeyboardType.default, UIKeyboardType.default]
        let capitalizationTypes = [UITextAutocapitalizationType.words, UITextAutocapitalizationType.none, UITextAutocapitalizationType.none, UITextAutocapitalizationType.none]
        let secureTextEntrys = [false, false, true, true]
        
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
        if !UIHelper.isValidTextField(field: cells[0].cellContentView.authTextField) {
            isValid = false
        }
        if !UIHelper.isValidEmail(field: cells[1].cellContentView.authTextField) {
            isValid = false
        }
        if !UIHelper.isValidPasswordsEqual(passwordField: cells[2].cellContentView.authTextField, confirmPasswordField: cells[3].cellContentView.authTextField) {
            isValid = false
        }
        
        return isValid
    }
    
    //MARK: - Actions -
    func signUp() {
        if isValidInputParams() {
            let name = cells[0].cellContentView.authTextField.text!
            let email = cells[1].cellContentView.authTextField.text!
            let password = cells[2].cellContentView.authTextField.text!
            let json = JSON(["name" : name, "email" : email, "password" : password, "password_c" : password])
            
            output.signupButtonClicked(json)
        }
    }
    
    //MARK: - Keyboard notifications -
    func keyboardWillChangeFrame(_ notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let animationDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber) as! TimeInterval
            let height = keyboardFrame.origin.y
            
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: animationDuration, animations: { _ in
                self.signUpView.heighTBLConstraint.constant = height - NAV_HEIGHT
                self.view.layoutIfNeeded()
            })
        }
    }
}

//MARK: - extension for SignUpViewInput -
extension SignUpViewController: SignUpViewInput {
    
    func setupInitialState() {
        
    }
}

//MARK: - extension for UITableView -
extension SignUpViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        
        return AU_BTN_HEIGHT*1.5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footerView.button.addTarget(self, action: #selector(SignUpViewController.signUp), for: UIControlEvents.touchUpInside)
        
        return footerView
    }
}

//MARK: - extension for UITextField -
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag != cells.count - 1 {
            let indexNext = textField.tag + 1
            cells[indexNext].cellContentView.authTextField.becomeFirstResponder()
            signUpView.tableView.scrollToRow(at: NSIndexPath(row: indexNext, section: 0) as IndexPath, at: .none, animated: true)
        } else {
            textField.resignFirstResponder()
            signUp()
        }
        return true
    }
}
