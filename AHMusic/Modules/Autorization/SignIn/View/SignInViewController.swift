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
    
    var cells = Array<SignInCell>()
    
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
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: - Private Methods
    private func baseConfig() {
        self.view = signInView
        
        configurateTableViewCells()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    
    private func configurateTableViewCells() {
        let placeholders = ["User Name", "Password"]
        let keyTypes = [UIReturnKeyType.Next, UIReturnKeyType.Go]
        let keyboardTypes = [UIKeyboardType.EmailAddress, UIKeyboardType.Default]
        let capitalizationTypes = [UITextAutocapitalizationType.None, UITextAutocapitalizationType.None]
        let secureTextEntrys = [false, true]
        
        for i in 0..<placeholders.count {
            let signInCell = SignInCell()
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
        var isValid = true
//        if !Utils.isValidTextField(cells[0].cellContentView.authTextField) {
//            isValid = false
//        }
//        if !Utils.isValidTextField(cells[1].cellContentView.authTextField) {
//            isValid = false
//        }
        
        return isValid
    }
    
    //MARK: - Actions
    func signIn() {
        //        let username = cells[0].cellContentView.authTextField.text
        //        let password = cells[1].cellContentView.authTextField.text
        let username = "vtgsoftware"
        let password = "vtgsoftware123"
        let mandate  = "cascade"
        
        cells[0].cellContentView.authTextField.text = username
        cells[1].cellContentView.authTextField.text = password
        
        let params = ["userName" : username, "password" : password, "mandate" : mandate]
        
        if isValidInputParams() {

        }
    }
    
    //MARK: - Keyboard notifications
    func keyboardWillChangeFrame(notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() {
            let animationDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber) as! NSTimeInterval
            let height = keyboardFrame.origin.y
            
            self.view.layoutIfNeeded()
            UIView.animateWithDuration(animationDuration, animations: { _ in
                self.signInView.heighTBLConstraint.constant = height
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

//MARK: - extension for SignInViewInput -
extension SignInViewController: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return cells[indexPath.row]
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 300
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 100
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return headerView
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footerView.button.addTarget(self, action: #selector(signIn), forControlEvents: UIControlEvents.TouchUpInside)
        
        return footerView
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.tag == 0 {
            cells[1].cellContentView.authTextField.becomeFirstResponder()
            signInView.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0), atScrollPosition: .None, animated: true)
        } else {
            textField.resignFirstResponder()
            signIn()
        }
        return true
    }
    
}
