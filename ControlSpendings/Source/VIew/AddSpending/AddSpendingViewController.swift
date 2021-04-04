//
//  AddSpendingViewController.swift
//  ControlSpendings
//
//  Created by Юрий Дубровин on 02.04.2021.
//

import UIKit

class AddSpendingViewController: UIViewController {
    @IBOutlet weak var addSpendingTable: UITableView!
    
    var firstIndexPath: IndexPath?
    var secondIndexPath: IndexPath?
    var tIndexpath: IndexPath?
    var fIndexPath: IndexPath?
    var fifIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSpendingTable.delegate = self
        self.addSpendingTable.register(UINib(nibName: "NameTableViewCell", bundle: nil), forCellReuseIdentifier: "nameCell")
        self.addSpendingTable.register(UINib(nibName: "PriceTableViewCell", bundle: nil), forCellReuseIdentifier: "priceCell")
        self.addSpendingTable.register(UINib(nibName: "CurrencyTableViewCell", bundle: nil), forCellReuseIdentifier: "currencyCell")
        self.addSpendingTable.register(UINib(nibName: "DatePaymentTableViewCell", bundle: nil), forCellReuseIdentifier: "DatePaymentCell")
        self.addSpendingTable.register(UINib(nibName: "CyclePaymentTableViewCell", bundle: nil), forCellReuseIdentifier: "CyclePaymentCell")
        //DatePaymentCell
        //CyclePaymentCell
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addBaseData(_ sender: Any) {
        //MARK: - сохранить в базу
        let cell = self.addSpendingTable.cellForRow(at: firstIndexPath!) as! NameTableViewCell
        let name = cell.nameTextFiled.text
        let cell1 = self.addSpendingTable.cellForRow(at: secondIndexPath!) as! PriceTableViewCell
        let price = cell1.priceTextField.text
        let cell2 = self.addSpendingTable.cellForRow(at: self.tIndexpath!) as! CurrencyTableViewCell
        let currency = cell2.curency.text
        let cell3 = self.addSpendingTable.cellForRow(at: fIndexPath!) as! DatePaymentTableViewCell
        let date = cell3.date
        let cell4 = self.addSpendingTable.cellForRow(at: fifIndexPath!) as! CyclePaymentTableViewCell
        
        let cycle = cell4.cyclePaymentTextFild.text
        DBManagerRealm.sharedManager.addSpending(name: name!, currency: currency!, date: date!, cycle: cycle!, price: price!)
        performSegue(withIdentifier: "MoveToSpendingController", sender: self)
    }
    
}


//MARK: -  UITableViewDelegate & UITableViewDataSource

extension AddSpendingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NameTableViewCell
            cell.setupCell(name: "навание")
            self.firstIndexPath = indexPath
            return cell
        }
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "priceCell", for: indexPath) as! PriceTableViewCell
            //cell.setupCell(name: "навание")
            self.secondIndexPath = indexPath
            return cell
        }
        if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as! CurrencyTableViewCell
            self.tIndexpath = indexPath
            cell.setupCell()
            return cell
        }
        if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DatePaymentCell", for: indexPath) as! DatePaymentTableViewCell
            self.fIndexPath = indexPath
            return cell
        }
        if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CyclePaymentCell", for: indexPath) as! CyclePaymentTableViewCell
            self.fifIndexPath = indexPath
            cell.setupCell()
            return cell
        }
        
        return UITableViewCell()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.addSpendingTable.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.cellForRow(at: indexPath)?.isSelected = false
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 2{
            //openDatePicker(index: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func openDatePicker(index: IndexPath){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        let cell = self.addSpendingTable.cellForRow(at: index) as! CurrencyTableViewCell
        cell.curency.inputView = datePicker
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let ca = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let a = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
        let b = UIBarButtonItem(title: "Done", style: .done, target: self, action: nil)
        toolBar.setItems([a,ca,b], animated: false)
        cell.curency.inputAccessoryView = toolBar
    }
    
    
}
