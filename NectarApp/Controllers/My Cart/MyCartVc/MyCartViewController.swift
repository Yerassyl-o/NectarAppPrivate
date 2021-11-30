//
//  MyCartViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 20.11.2021.
//

import UIKit

class MyCartViewController: UIViewController {
    
    var dataBase = DefaultDataBase.shared
    
    @IBOutlet weak var goToCheckoutButton: UIButton!
    @IBOutlet weak var productPriceSumLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSettings()
        registerCustomCells()
        didLoadSettings()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        productPriceSumLabel.text = "$\(DefaultDataBase.shared.getMyCartsCosts())"
    }
    
    
    @IBAction func goToCheckoutButtonAction(_ sender: Any) {
        presentCheckoutViewController()
    }
}

extension MyCartViewController {
    
    func tableViewSettings() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func didLoadSettings(){
        tableView.separatorInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .clear
        productPriceSumLabel.text = "\(DefaultDataBase.shared.getMyCartsCosts())"
        productPriceSumLabel.layer.cornerRadius = 20
    }
}
extension MyCartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataBase.userCarts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCartItemsTableViewCell", for: indexPath) as! MyCartItemsTableViewCell
        let productInfo = dataBase.userCarts[indexPath.row].productName
        let product = dataBase.findProducts(name: productInfo)
        
        cell.productName.text = product.productName
        cell.productValue.text = "\(product.productQuantity)\(product.productUnitOfMeasurement), Price"
        cell.productPriceFor1Item.text = "$\(product.productPrice)"
        cell.productImage.image = product.productImage
        cell.productCount.text = "\(dataBase.userCarts[indexPath.row].count)"
        
        cell.removeProductButtonTap = {
            self.tableView.reloadData()
        }
        
        cell.counterButtonsTap = {
            self.productPriceSumLabel.text = "$\(DefaultDataBase.shared.getMyCartsCosts())"
        }
        
        cell.selectionStyle = .none
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156
    }
    
}

extension MyCartViewController {
    
    func registerCustomCells(){
        tableView.register(UINib.init(nibName: "MyCartItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCartItemsTableViewCell")
    }
    
    func presentCheckoutViewController() {
        if let viewContoller = storyboard?.instantiateViewController(identifier: "CheckoutViewController") as? CheckoutViewController {
            viewContoller.modalTransitionStyle = .coverVertical
            viewContoller.modalPresentationStyle = .popover
            self.present(viewContoller, animated: true, completion: nil)
            
        }
    }
}
