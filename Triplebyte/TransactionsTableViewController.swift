//
//  TransactionsTableViewController.swift
//  Triplebyte
//
//  Created by Mitchell Budge on 10/9/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit
import Foundation

class TransactionsTableViewController: UITableViewController {

    var transactionData: [Transaction] = [Transaction(location: "Dinner at Momo's", date: "7/28/17", amount: 15.35, category: .food), Transaction(location: "Lunch at Pete's", date: "8/5/17", amount: 17.25, category: .food), Transaction(location: "Whole Foods", date: "7/29/17", amount: 22.50, category: .groceries)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let newTransaction = Transaction(location: "Safeway", date: "7/31/17", amount: 60.50, category: .groceries)
        transactionData.append(newTransaction)
        self.tableView.reloadData()
    }
    
    // MARK: - Amount Formatter


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header \(section)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionTableViewCell
        let transaction = transactionData[indexPath.row]
        cell.locationLabel.text = transaction.location
        cell.dateLabel.text = transaction.date
        
        let amountFormatter = NumberFormatter()
        amountFormatter.numberStyle = .currency
        amountFormatter.locale = Locale.current
        cell.amountLabel.text = amountFormatter.string(for: transaction.amount)
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
