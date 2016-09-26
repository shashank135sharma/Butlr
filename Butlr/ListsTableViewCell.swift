//
//  ListsTableViewCell.swift
//  Butlr
//
//  Created by Shashank Sharma on 9/25/16.
//  Copyright © 2016 Shashank Sharma. All rights reserved.
//

import UIKit

class ListsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(titleText: String, descriptionText: String, date: NSDate, indexPath: NSIndexPath) {
        var index = [1,-1,0];
        descriptionLabel.text = descriptionText;
        TitleLabel.text = titleText;
        if(daysTill(date) < 0) {
            dueDateLabel.textColor = UIColor.blackColor()
        }
        dueDateLabel.text = "\(index[indexPath.row]) days left";
    }
    
    func daysTill(endDate: NSDate) -> Int
    {
        let startDate = NSDate();
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components([.Day], fromDate: startDate, toDate: endDate, options: [])
        
        return components.day
    }
}
