//
//  GuestTableViewCell.swift
//  Milu
//
//  Created by Admin on 8/20/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit
import APAvatarImageView

class GuestTableViewCell: UITableViewCell {

    
    @IBOutlet weak var avatarImageView: APAvatarImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.borderWidth = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
