//
//  FollowingTableViewCell.swift
//  Milu
//
//  Created by Admin on 8/23/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit
import APAvatarImageView

class FollowingTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: APAvatarImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var divider: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       avatarImageView.borderWidth = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
