//
//  AddressCell.swift
//  Milu
//
//  Created by Admin on 8/19/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet weak var addressField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
