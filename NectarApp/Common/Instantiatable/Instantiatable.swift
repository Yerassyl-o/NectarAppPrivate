//
//  Instantiatable.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import UIKit

protocol Instantiatable {
    static func instantiate() -> Self
}

extension Instantiatable where Self: UIViewController {
    
    static func instantiate() -> Self {
        let viewName = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewName) as? Self else {
            fatalError("Failed to instantiate controller \(viewName)")
        }
        return viewController
    }
}

extension UIViewController: Instantiatable {}
