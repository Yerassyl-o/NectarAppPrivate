//
//  AccountViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 19.11.2021.
//

import UIKit

class AccountViewController: UIViewController {
    
    var menuDataBase = MenuModels()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSettings()
        registerCustomCells()
    }
    
    
}

extension AccountViewController {
    
    func tableViewSettings() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorColor = .clear
    }
    
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountInfoTableViewCell", for: indexPath) as! AccountInfoTableViewCell
            cell.selectionStyle = .none
            return cell
            
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogOutTableViewCell", for: indexPath) as! LogOutTableViewCell
            cell.selectionStyle = .none
            cell.logOutButtonTap = {
                if let viewController = self.storyboard?.instantiateViewController(identifier: "LogInViewController") as? LogInViewController {
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController, animated: true, completion: nil)
                }
                
            }
            return cell
            
        default:
            let info = menuDataBase.menuBaseDataGet[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
            cell.menuIconImage.image = info.icon
            cell.menuNameLabel.text = info.menuName
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        
        case 0:
            return 115
            
        case 9:
            return 170
            
        default:
            return 62
        }
    }
}

extension AccountViewController{
    
    func registerCustomCells(){
        tableView.register(UINib.init(nibName: "AccountInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountInfoTableViewCell")
        tableView.register(UINib.init(nibName: "LogOutTableViewCell", bundle: nil), forCellReuseIdentifier: "LogOutTableViewCell")
        tableView.register(UINib.init(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
    }
}
