//
//  TasksListTableViewCell.swift
//  Butlr
//
//  Created by Shashank Sharma on 9/24/16.
//  Copyright © 2016 Shashank Sharma. All rights reserved.
//

import UIKit

class TasksListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var tasksRemainingLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(LocationName: String, tasksRemaining: Int) {
        LocationLabel.text = LocationName
        tasksRemainingLabel.text = "Tasks remaining: \(tasksRemaining)";
    }

}
