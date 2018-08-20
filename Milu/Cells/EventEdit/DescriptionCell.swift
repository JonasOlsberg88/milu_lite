//
//  DescriptionCell.swift
//  Milu
//
//  Created by Admin on 8/20/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit
import MultilineTextField

class DescriptionCell: UITableViewCell {

    @IBOutlet weak var descriptionField: MultilineTextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionField.placeholderColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
