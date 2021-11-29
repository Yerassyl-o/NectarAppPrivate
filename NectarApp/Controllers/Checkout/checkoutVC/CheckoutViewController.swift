//
//  CheckoutViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 24.11.2021.
//

import UIKit

class CheckoutViewController: UIViewController {
    let checkoutMenu = CheckoutMenu()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageNameLabel: UILabel!
    @IBOutlet weak var closebutton: UIButton!
    @IBOutlet weak var placeOrderBuuton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        registerCustomCells()

    }
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func placeOrderButtonAction(_ sender: Any) {
        if let viewContoller = storyboard?.instantiateViewController(identifier: "OrderAcceptedViewController") as? OrderAcceptedViewController {
            viewContoller.modalPresentationStyle = .fullScreen
            self.present(viewContoller, animated: true, completion: nil)
            
        }
    }
    override func updateViewConstraints() {
        self.view.frame.origin.y =  view.frame.size.height - 530
           self.view.frame.size.height =  530
           
        self.view.roundCorners([.topLeft, .topRight], radius: 30.0)
           super.updateViewConstraints()
    }
}

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkoutMenu.getCheckoutMenu.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParametrElementFooterTableViewCell", for: indexPath) as! ParametrElementFooterTableViewCell
            cell.selectionStyle = .none
            return cell
        }  else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParametrElementsTableViewCell", for: indexPath) as! ParametrElementsTableViewCell
            let menu = checkoutMenu.getCheckoutMenu[indexPath.row]
            print(menu)
            cell.parametrNameLabel.text = menu.checkoutMenuName
            cell.parametrNameButton.setTitle(menu.checkoutSettingsName, for: .normal)
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
extension CheckoutViewController {
    
    func registerCustomCells(){
        
        tableView.register(UINib.init(nibName: "ParametrElementsTableViewCell", bundle: nil), forCellReuseIdentifier: "ParametrElementsTableViewCell")
        tableView.register(UINib.init(nibName: "ParametrElementFooterTableViewCell", bundle: nil), forCellReuseIdentifier: "ParametrElementFooterTableViewCell")
    }
    
}
