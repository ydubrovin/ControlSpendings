//
//  DatePaymentTableViewCell.swift
//  ControlSpendings
//
//  Created by Юрий Дубровин on 03.04.2021.
//

import UIKit

class DatePaymentTableViewCell: UITableViewCell {
    @IBOutlet weak var datePaymentTextField: UITextField!
    var date: Date?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(true)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print(true)
        openDatePicker()
        // Configure the view for the selected state
    }
    
    
    func openDatePicker(){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels

        
        datePaymentTextField.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 44))
        let ca = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let a = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
        let b = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneMy))
        toolBar.setItems([a,ca,b], animated: false)
        datePaymentTextField.inputAccessoryView = toolBar
    }
    
    
    @objc func doneMy(){
        if let date = datePaymentTextField.inputView as? UIDatePicker{
            print(date.date)
//            datePaymentTextField.text = "\(date.date)"
            let deteeee = date.date
            var dateFormaterr = DateFormatter()
            dateFormaterr.dateFormat = "d MMM yyyy"
            dateFormaterr.locale = Locale(identifier: "ru_RU")
            let dateee = dateFormaterr.string(from: deteeee)
            print(dateee)
            datePaymentTextField.text = dateFormaterr.string(from: deteeee)
            self.date = date.date
            
        }
    }
    
    @objc func cancel(){
        self.datePaymentTextField.endEditing(true)
    }
    
}
