//
//  ErrorViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 30.11.2021.
//

import UIKit

class ErrorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func PleaseTryAgainAction(_ sender: Any) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "OrderAcceptedViewController") as? OrderAcceptedViewController {
            
            viewController.modalPresentationStyle = .fullScreen
            
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func backToHomeAction(_ sender: Any) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "CustomTabABarvc") as? CustomTabABarvc {
            
            viewController.modalPresentationStyle = .fullScreen
            
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    override func updateViewConstraints() {
        
        self.view.frame.origin.y =  (view.frame.size.height - 601)/2
        self.view.frame.origin.x =  (view.frame.size.width - 364)/2
        self.view.frame.size.height =  601
        self.view.frame.size.width =  364
    
        self.view.layer.cornerRadius = 18
        super.updateViewConstraints()
    }
}
