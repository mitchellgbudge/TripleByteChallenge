//
//  TransactionsTableViewController.swift
//  Triplebyte
//
//  Created by Mitchell Budge on 10/9/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class TransactionsTableViewController: UITableViewController {

    var transactionData: [Transaction] = [Transaction(location: "Dinner at Momo's", amount: 15.35, category: .food),
                                            Transaction(location: "Lunch at Pete's", amount: 17.25, category: .food),
                                            Transaction(location: "Whole Foods", amount: 22.50, category: .groceries),
                                            Transaction(location: "Safeway", amount: 60.50, category: .groceries),
                                            Transaction(location: "Safeway", amount: 9.50, category: .groceries),
                                            Transaction(location: "Uber", amount: 22.50, category: .transportation)]
    
    var foodData: [Transaction] = []
    var groceriesData: [Transaction] = []
    var transportationData: [Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var header = ""
        switch section {
        case 0: header = "Food"
        case 1: header = "Groceries"
        case 2: header = "Transportation"
        default: break
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var filteredData: [Transaction] = []
        switch section {
        case 0:
            filteredData = transactionData.filter { $0.category == .food }
            foodData = filteredData
        case 1:
            filteredData = transactionData.filter { $0.category == .groceries }
            groceriesData = filteredData
        case 2:
            filteredData = transactionData.filter { $0.category == .transportation }
            transportationData = filteredData
        default:
            break
        }
        return filteredData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionTableViewCell
        let amountFormatter = NumberFormatter()
        amountFormatter.numberStyle = .currency
        amountFormatter.locale = Locale.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        switch indexPath.section {
        case 0:
            cell.locationLabel.text = foodData[indexPath.row].location
            cell.amountLabel.text = amountFormatter.string(for: foodData[indexPath.row].amount)
            cell.dateLabel.text = dateFormatter.string(from: foodData[indexPath.row].date)
        case 1:
            cell.locationLabel.text = groceriesData[indexPath.row].location
            cell.amountLabel.text = amountFormatter.string(for: groceriesData[indexPath.row].amount)
            cell.dateLabel.text = dateFormatter.string(from: groceriesData[indexPath.row].date)
        case 2:
            cell.locationLabel.text = transportationData[indexPath.row].location
            cell.amountLabel.text = amountFormatter.string(for: transportationData[indexPath.row].amount)
            cell.dateLabel.text = dateFormatter.string(from: transportationData[indexPath.row].date)
        default:
            break
        }
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
