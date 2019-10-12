//
//  TransactionTableViewCell.swift
//  Triplebyte
//
//  Created by Mitchell Budge on 10/9/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    // MARK: - Table View Cell Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
