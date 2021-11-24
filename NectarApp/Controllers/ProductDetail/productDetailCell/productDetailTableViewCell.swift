//
//  productDetailTableViewCell.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 24.11.2021.
//

import UIKit

class productDetailTableViewCell: UITableViewCell {
    
    let textInformation = "fdauskglfdsgjdfadjsgagfasjkfglajkdsgfljkadsgfjkladgsfsgjkadsjkf"
    var isToggle = false
    @IBOutlet weak var productDetailText: UILabel!
    @IBOutlet weak var productDetailButton: UIButton!
    
    var onProductDetailButtonTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productDetailText.text = textInformation
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func productDetailButtonAction(_ sender: Any) {
        
        isToggle.toggle()
    
        productDetailText.text = isToggle ? textInformation : nil
        onProductDetailButtonTap?()
        
    }
}
