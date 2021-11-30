//
//  FiltersTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 25.11.2021.
//

import UIKit

class FiltersTableViewCell: UITableViewCell {
    
    var buttonlogic = false
    let checkedImage = UIImage(named: "filterChecked")!
    let unCheckedImage = UIImage(named: "filterDontChecked")!
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var filterName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkButtonAction(_ sender: Any) {
        if buttonlogic == false {
            checkButton.setImage(checkedImage, for: UIControl.State.normal)
            filterName.textColor = UIColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 1)
        } else {
            checkButton.setImage(unCheckedImage, for: UIControl.State.normal)
            filterName.textColor = UIColor(red: 24/255, green: 23/255, blue: 37/255, alpha: 1)
            
        }
        buttonlogic.toggle()
    }
    
}
