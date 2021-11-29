//
//  OrderAcceptedViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 29.11.2021.
//

import UIKit



class OrderAcceptedViewController: UIViewController {

    @IBOutlet weak var trackOrderButton: UIButton!
    @IBOutlet weak var backToHomeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func trackOrderButtonAction(_ sender: Any) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "CustomTabABarvc") as? CustomTabABarvc {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
    @IBAction func backToHomeButtonAction(_ sender: Any) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "CustomTabABarvc") as? CustomTabABarvc {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
}

extension UIViewController {
    
}
