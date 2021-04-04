//
//  CurrencyTableViewCell.swift
//  ControlSpendings
//
//  Created by Юрий Дубровин on 03.04.2021.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    //izmenit
    @IBOutlet weak var curency: UITextField!
    let curencymass = Currency()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(){
        self.curency.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1176470588, alpha: 1)
        self.curency.delegate = self
        self.curency.tintColor = .clear
    }
    
}

extension CurrencyTableViewCell: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(true)
        openDatePicker()
    }
    
    func openDatePicker(){
        let datePicker = UIPickerView()
        datePicker.dataSource = self
        datePicker.delegate = self
        
        
        curency.inputView = datePicker
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 44))
        let ca = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let a = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
        let b = UIBarButtonItem(title: "Done", style: .done, target: self, action: nil)
        toolBar.setItems([a,ca,b], animated: false)
        curency.inputAccessoryView = toolBar
    }
}

extension CurrencyTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        curencymass.curency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return curencymass.curency[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        curency.text = curencymass.curency[row]
    }
    
    
    
    
}
