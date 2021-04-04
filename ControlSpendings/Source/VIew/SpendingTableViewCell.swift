//
//  SpendingTableViewCell.swift
//  ControlSpendings
//
//  Created by Юрий Дубровин on 03.04.2021.
//

import UIKit

class SpendingTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var imageMy: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        //self.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width - 40, height: self.bounds.size.height)
        super.layoutSubviews()
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
    func setupCell(name:String, date:Date, price:String, curency: String){
        self.imageMy.layer.cornerRadius = 15
        nameLable.text = name
        let deteeee = date
        let dateFormaterr = DateFormatter()
        dateFormaterr.dateFormat = "d MMM yyyy"
        dateFormaterr.locale = Locale(identifier: "ru_RU")
        let dateee = dateFormaterr.string(from: deteeee)
        print(dateee)
        dateLable.text = dateFormaterr.string(from: deteeee)
        priceLable.text = price + "$"//curency
    }
    
}
