//
//  FiltersViewController.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 25.11.2021.
//

import UIKit



protocol FiltersViewControllerDelegate: AnyObject {
    func buttonClicked()
}

class FiltersViewController: UIViewController {
    
    weak var delegate: FiltersViewControllerDelegate?
    
    let filterMenuBase = FilterMenu()
    var viewController: UIViewController?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var applyFilter: UIButton!
    var brand: [String]?
    var category: [String]?
    
    var sendData:(() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewSettings()
        navBArSettings()
        
    }
    
    @IBAction func applyFilterAction(_ sender: Any) {
    }
}



extension FiltersViewController {
    
    func tableViewSettings(){
        tableView.delegate = self
        tableView.dataSource = self
        registerCustomCells()
        tableView.separatorColor = .clear
        tableView.sectionIndexBackgroundColor = .clear
        tableView.backgroundColor = UIColor(red: 242/255, green: 243/255, blue: 242/255, alpha: 1)
    }
    
    func navBArSettings() {
        let customBackButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButton))
        
        navigationItem.leftBarButtonItem = customBackButton
        navigationItem.hidesBackButton = true
       
    }
    
    @objc func backButton(_ button: UIBarButtonItem){
        navigationController?.popViewController(animated: true)
    }
}
extension FiltersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        filterMenuBase.getFilters.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filterMenuBase.getFilters[section].filterName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterMenuBase.getFilters[section].filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FiltersTableViewCell", for: indexPath) as! FiltersTableViewCell
        cell.selectionStyle = .none
        
        let filter = filterMenuBase.getFilters[indexPath.section].filters[indexPath.row]
        cell.filterName.text = filter
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "FilterNameTableViewCell") as! FilterNameTableViewCell
        
        headerCell.filterName.text = filterMenuBase.getFilters[section].filterName
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footercell = tableView.dequeueReusableCell(withIdentifier: "SectionFooterTableViewCell") as! SectionFooterTableViewCell
        return footercell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.buttonClicked()
    }
}
extension FiltersViewController {
    
    func registerCustomCells(){
        tableView.register(UINib.init(nibName: "FiltersTableViewCell", bundle: nil), forCellReuseIdentifier: "FiltersTableViewCell")
        tableView.register(UINib.init(nibName: "FilterNameTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterNameTableViewCell")
        tableView.register(UINib.init(nibName: "SectionFooterTableViewCell", bundle: nil), forCellReuseIdentifier: "SectionFooterTableViewCell")
    }
}
