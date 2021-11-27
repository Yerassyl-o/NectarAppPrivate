//
//  VerificationViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 18.11.2021.
//

import UIKit

class VerificationViewController: UIViewController {
    let verificationModels = VerificationModels()
    var logic = [true,true,true,true]
    
    @IBOutlet weak var codeEnterTextField: UITextField!
    @IBOutlet weak var bottom1pxView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
        keyBoardSetUp()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}


extension VerificationViewController {
    func setUpTextField() {
        codeEnterTextField.keyboardType = .numberPad
        codeEnterTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    

    @objc func textFieldDidChange(_ textField: UITextField) {
       codeEnterSetup()
    }
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


extension VerificationViewController {
    func codeEnterSetup() {
        if codeEnterTextField.text!.count <= 7 && codeEnterTextField.text!.count > 0 {
            switch codeEnterTextField.text!.count {
            case 1: if logic[0] == true {
                codeEnterTextField!.text = codeEnterTextField.text! + "-"
                logic[0] = false
                print(logic[0])
            } else if logic[0] == false {
                codeEnterTextField.deleteBackward()
                logic[0] = true
                print(logic[0])
            }
            bottom1pxView.backgroundColor = .systemRed
            case 3: if logic[1] == true {
                codeEnterTextField!.text = codeEnterTextField.text! + "-"
                logic[1] = false
            } else if logic[1] == false {
                codeEnterTextField.deleteBackward()
                logic[1] = true
            }
            case 5: if logic[2] == true {
                codeEnterTextField!.text = codeEnterTextField.text! + "-"
                logic[2] = false
            } else if logic[2] == false {
                codeEnterTextField.deleteBackward()
                logic[2] = true
            }
            bottom1pxView.backgroundColor = .systemRed
            case 7: bottom1pxView.backgroundColor = .systemGreen
            default: break
            }
        } else if codeEnterTextField.text!.count > 7 && codeEnterTextField.text!.count > 0 {
            codeEnterTextField.deleteBackward()
        }
        else if codeEnterTextField.text!.count == 0 {
            bottom1pxView.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        }
    }
}
