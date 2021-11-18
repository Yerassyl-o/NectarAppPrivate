//
//  SingInViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 16.11.2021.
//

import UIKit

class SingInViewController: UIViewController {
    var logic = [true, true, true, true]
    
    @IBOutlet weak var numberEnterField: UITextField!
    @IBOutlet weak var bottom1pxView: UIView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var OrSoialMediaText: UILabel!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpnumberEnterField()
        keyBoardSetUp()
    }
    @IBAction func locationButtonAction(_ sender: Any) {
    }
    @IBAction func contnueGoogleAction(_ sender: Any) {
    }
    @IBAction func contnueFacebookAction(_ sender: Any) {
    }
}







extension SingInViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}

extension SingInViewController: UITextFieldDelegate {
    
    func setUpnumberEnterField(){
        numberEnterField.keyboardType = .numberPad
        self.numberEnterField.delegate = self
        numberEnterField.text = "+77"
        numberEnterField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        numberEnterSetup()
    }
    
    func numberEnterSetup() {
        if numberEnterField.text!.count <= 15 && numberEnterField.text!.count > 1 {
            switch numberEnterField.text!.count {
            case 2: numberEnterField.text! = "+77"
            case 5: if logic[0] == true {
                numberEnterField!.text = numberEnterField.text! + "-"
                logic[0] = false
                print(logic[0])
            } else if logic[0] == false {
                numberEnterField.deleteBackward()
                logic[0] = true
                print(logic[0])
            }
            bottom1pxView.backgroundColor = .systemRed
            case 9: if logic[1] == true {
                numberEnterField!.text = numberEnterField.text! + "-"
                logic[1] = false
            } else if logic[1] == false {
                numberEnterField.deleteBackward()
                logic[1] = true
            }
            case 12: if logic[2] == true {
                numberEnterField!.text = numberEnterField.text! + "-"
                logic[2] = false
            } else if logic[2] == false {
                numberEnterField.deleteBackward()
                logic[2] = true
            }
            bottom1pxView.backgroundColor = .systemRed
            case 15: bottom1pxView.backgroundColor = .systemGreen
            default: break
            }
        } else if numberEnterField.text!.count > 15 && numberEnterField.text!.count > 1 {
            numberEnterField.deleteBackward()
        }
        else if numberEnterField.text!.count == 3 {
            bottom1pxView.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        }
    }
}

extension SingInViewController {
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
