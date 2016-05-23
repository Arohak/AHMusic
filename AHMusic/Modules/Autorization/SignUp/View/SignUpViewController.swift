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
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: - Private Methods -
    private func baseConfig() {
        self.view = signUpView
        
        self.title = "Sign Up"
        configurateTableViewCells()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SignUpViewController.keyboardWillChangeFrame(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    
    private func configurateTableViewCells() {
        let placeholders = ["Full Name", "Email", "Password", "Confirm Password"]
        let keyTypes = [UIReturnKeyType.Next, UIReturnKeyType.Next, UIReturnKeyType.Next, UIReturnKeyType.Go]
        let keyboardTypes = [UIKeyboardType.Default, UIKeyboardType.EmailAddress, UIKeyboardType.Default, UIKeyboardType.Default]
        let capitalizationTypes = [UITextAutocapitalizationType.Words, UITextAutocapitalizationType.None, UITextAutocapitalizationType.None, UITextAutocapitalizationType.None]
        let secureTextEntrys = [false, false, true, true]
        
        for i in 0..<placeholders.count {
            let signInCell = FieldCell()
            signInCell.selectionStyle = .None
            signInCell.cellContentView.authTextField.autocapitalizationType = capitalizationTypes[i]
            signInCell.cellContentView.authTextField.secureTextEntry = secureTextEntrys[i]
            signInCell.cellContentView.authTextField.keyboardType = keyboardTypes[i]
            signInCell.cellContentView.authTextField.placeholder = placeholders[i]
            signInCell.cellContentView.authTextField.returnKeyType = keyTypes[i]
            signInCell.cellContentView.authTextField.delegate = self
            signInCell.cellContentView.authTextField.tag = i
            
            cells.append(signInCell)
        }
    }
    
    private func isValidInputParams() -> Bool {
        
        return true
    }
    
    //MARK: - Actions -
    func signUp() {

    }
    
    //MARK: - Keyboard notifications -
    func keyboardWillChangeFrame(notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() {
            let animationDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber) as! NSTimeInterval
            let height = keyboardFrame.origin.y
            
            self.view.layoutIfNeeded()
            UIView.animateWithDuration(animationDuration, animations: { _ in
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return cells[indexPath.row]
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return AU_CELL_HEIGHT
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return SI_LOGO_SIZE*1.5
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return AU_BTN_HEIGHT*1.5
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return headerView
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footerView.button.addTarget(self, action: #selector(SignUpViewController.signUp), forControlEvents: UIControlEvents.TouchUpInside)
        
        return footerView
    }
}

//MARK: - extension for UITextField -
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.tag == 0 {
            cells[1].cellContentView.authTextField.becomeFirstResponder()
            signUpView.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0), atScrollPosition: .None, animated: true)
        } else {
            textField.resignFirstResponder()
            signUp()
        }
        return true
    }
}
