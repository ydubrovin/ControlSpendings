//
//  ViewController.swift
//  ControlSpendings
//
//  Created by Юрий Дубровин on 02.04.2021.
//

import UIKit
import RealmSwift
import AudioToolbox

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    var sprending: Results<SpendingModel>?
    var selectedIdCell = -1
    let color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))// не та вибрация
        
        let record = DBManagerRealm.sharedManager.getSpendings()
        self.sprending = record
        print(record)
        self.table.delegate = self
        self.table.dataSource = self
        self.table.register(UINib(nibName: "SpendingTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.table.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func unwindSpendingController(_ sender: UIStoryboardSegue){
        let record = DBManagerRealm.sharedManager.getSpendings()
        self.sprending = record
        self.table.reloadData()
    }

    @IBAction func addSpending(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        performSegue(withIdentifier: "moveToAddSpending", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToChangeSpending"{
            
        }
    }
    //moveToAddSpending
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sprending?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpendingTableViewCell
        cell.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1176470588, alpha: 1)
        //cell.layer.borderColor = UIColor.black.cgColor
        //cell.textLabel?.text = "dsfsdf"
        cell.layer.borderWidth = 3
//        cell.layer.cornerRadius = 8
//        cell.clipsToBounds = true
        cell.setupCell(name: sprending![indexPath.row].name, date: sprending![indexPath.row].date, price: sprending![indexPath.row].price, curency: sprending![indexPath.row].currency)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.00
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.selectedIdCell = indexPath.row
        performSegue(withIdentifier: "moveToChangeSpending", sender: self)
        //moveToChangeSpending
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 75
//    }
    

    

    
    
}

