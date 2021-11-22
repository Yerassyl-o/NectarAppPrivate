//
//  HomeScreenViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 22.11.2021.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerCustomCells()
        tableView.separatorColor = .clear
    }
}
extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenHeaderTableViewCell", for: indexPath) as! HomeScreenHeaderTableViewCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeScreeSearchBarTableViewCell", for: indexPath) as! homeScreeSearchBarTableViewCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSreenBannerTableViewCell", for: indexPath) as! HomeSreenBannerTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 107
        } else if indexPath.row == 1 {
            return 52
        } else if indexPath.row == 2 {
            return 165
        } else if indexPath.row == 3 {
            return 327
        } else if indexPath.row == 4 {
            return 327
        } else {
            return 200
        }
    }
}
extension HomeScreenViewController {
    func registerCustomCells(){
        
        tableView.register(UINib.init(nibName: "HomeScreenHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeScreenHeaderTableViewCell")
        tableView.register(UINib.init(nibName: "homeScreeSearchBarTableViewCell", bundle: nil), forCellReuseIdentifier: "homeScreeSearchBarTableViewCell")
        tableView.register(UINib.init(nibName: "HomeSreenBannerTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeSreenBannerTableViewCell")
    }
}
