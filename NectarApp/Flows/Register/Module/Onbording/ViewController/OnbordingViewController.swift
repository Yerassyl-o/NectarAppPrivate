//
//  OnbordingViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 18.11.2021.
//

import UIKit

protocol OnbordingView: AnyObject {
    
}

class OnbordingViewController: UIViewController {

    var presenter: OnbordingPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onButtonDidTap(_ sender: Any) {
        presenter.onButtonDidTap()
    }
}

extension OnbordingViewController: OnbordingView {
    
}
