//
//  RepeatIntervalTableViewCell.swift
//  Milu
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class RepeatIntervalTableViewCell: UITableViewCell {

    @IBOutlet weak var intervalItemLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
