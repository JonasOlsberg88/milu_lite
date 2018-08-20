//
//  DurationCell.swift
//  Milu
//
//  Created by Admin on 8/20/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class DurationCell: UITableViewCell {

    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var durationView: UIView!
    
    let timePicker = TimePickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.timePicker.setValue(UIColor.white, forKey: "textColor")
//        self.timePicker.subviews[0].subviews[1].layer.borderColor = UIColor.white.cgColor
//        self.timePicker.subviews[0].subviews[1].layer.borderWidth = 1
//        self.timePicker.subviews[0].subviews[2].layer.borderColor = UIColor.white.cgColor
//        self.timePicker.subviews[0].subviews[2].layer.borderWidth = 1
        
        timePicker.frame = durationView.frame
        durationView.addSubview(timePicker)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    

}
