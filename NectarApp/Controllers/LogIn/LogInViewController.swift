//
//  LogInViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 18.11.2021.
//

import UIKit

class LogInViewController: UIViewController {
    var loginSecureText = true
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var secureNoSecureButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var singUpButton: UIButton!
    @IBOutlet weak var bottomPassword1pxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        keyBoardSetUp()
        setUpnumberEnterFieldPassword()
    }
    @IBAction func secureNoSecureAction(_ sender: Any) {
        setUpsecureNoSecure()
    }
}

//MARK: SetUp keyboard
extension LogInViewController {
    func keyBoardSetUp() {
        setupToHideKeyboardOnTapOnView()
    }
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension LogInViewController{
    
}

extension LogInViewController: UITextFieldDelegate {
    func setUpsecureNoSecure(){
        if loginSecureText == true {
            passwordTextField.isSecureTextEntry = false
            loginSecureText = false
        } else if loginSecureText == false {
            passwordTextField.isSecureTextEntry = true
            loginSecureText = true
        }
    }
    func setUpnumberEnterFieldPassword(){
        passwordTextField.keyboardType = .alphabet
        passwordTextField.isSecureTextEntry = true
        self.passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.becomeFirstResponder()
        self.view.endEditing(true)
        return false
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        numberEnterSetup()
    }
    
    func numberEnterSetup() {
        if passwordTextField.text!.count <= 7 && passwordTextField.text!.count > 0 {
            bottomPassword1pxView.backgroundColor = .systemRed
            
        } else if passwordTextField.text!.count == 0 {
            bottomPassword1pxView.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        } else if passwordTextField.text!.count > 7 {
            bottomPassword1pxView.backgroundColor = .systemGreen
        }
    }
}





    
    

