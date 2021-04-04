//
//  CyclePaymentTableViewCell.swift
//  ControlSpendings
//
//  Created by Юрий Дубровин on 03.04.2021.
//

import UIKit

class CyclePaymentTableViewCell: UITableViewCell {
    @IBOutlet weak var cyclePaymentTextFild: UITextField!
    
    let cycle = CyclePayment()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(){
        self.cyclePaymentTextFild.delegate = self
        openDatePicker()
    }
    
    

    
}


extension CyclePaymentTableViewCell: UITextFieldDelegate{
    func openDatePicker(){
        let datePicker = UIPickerView()
        datePicker.dataSource = self
        datePicker.delegate = self
        
        
        cyclePaymentTextFild.inputView = datePicker
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 44))
        let ca = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let a = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
        let b = UIBarButtonItem(title: "Done", style: .done, target: self, action: nil)
        toolBar.setItems([a,ca,b], animated: false)
        cyclePaymentTextFild.inputAccessoryView = toolBar
    }
}


extension CyclePaymentTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cycle.cyclePayment.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cycle.cyclePayment[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cyclePaymentTextFild.text = cycle.cyclePayment[row]
    }
    
    
    
    
}
