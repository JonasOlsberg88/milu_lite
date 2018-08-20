//
//  StartsCell.swift
//  Milu
//
//  Created by Admin on 8/19/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class StartsCell: UITableViewCell {

    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.datePicker.setValue(UIColor.white, forKey: "textColor")
        self.datePicker.subviews[0].subviews[1].layer.borderColor = UIColor.white.cgColor
        self.datePicker.subviews[0].subviews[1].layer.borderWidth = 1
        self.datePicker.subviews[0].subviews[2].layer.borderColor = UIColor.white.cgColor
        self.datePicker.subviews[0].subviews[2].layer.borderWidth = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
