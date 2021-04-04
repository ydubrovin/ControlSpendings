//
//  PriceTableViewCell.swift
//  ControlSpendings
//
//  Created by Юрий Дубровин on 02.04.2021.
//

import UIKit

class PriceTableViewCell: UITableViewCell {
    @IBOutlet weak var priceTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
