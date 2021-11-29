//
//  MyCartViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 20.11.2021.
//

import UIKit

class MyCartViewController: UIViewController {
    var productDataBase = ProductDataBase()
    var productPriceSumCounter: Double = 0
    @IBOutlet weak var goToCheckoutButton: UIButton!
    @IBOutlet weak var productPriceSumLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        registerCustomCells()
        tableView.separatorInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .clear
        productPriceSumLabel.text = "\(productPriceSumCounter)"
    }
    
    @IBAction func goToCheckoutButtonAction(_ sender: Any) {
        if let viewContoller = storyboard?.instantiateViewController(identifier: "CheckoutViewController") as? CheckoutViewController {
            viewContoller.modalTransitionStyle = .coverVertical
            viewContoller.modalPresentationStyle = .popover
            self.present(viewContoller, animated: true, completion: nil)
            
        }
    }
}

extension MyCartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productDataBase.getDataBase.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderMyCartTableViewCell", for: indexPath) as! HeaderMyCartTableViewCell
//            cell.selectionStyle = .none
//            return cell
//        } else {

            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCartItemsTableViewCell", for: indexPath) as! MyCartItemsTableViewCell
            let product = productDataBase.getDataBase[indexPath.row ]
            cell.productName.text = product.productName
            cell.productValue.text = "\(product.productQuantity)\(product.productUnitOfMeasurement), Price"
            cell.productPriceFor1Item.text = "$\(product.productPrice)"
            cell.productImage.image = product.productImage
            cell.selectionStyle = .none
//            productPriceSumCounter += product.productPrice
            
            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 57
//        } else {
            return 156
//        }
    }
    
}

extension MyCartViewController {
    func registerCustomCells(){
        tableView.register(UINib.init(nibName: "MyCartItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCartItemsTableViewCell")
    }
}
