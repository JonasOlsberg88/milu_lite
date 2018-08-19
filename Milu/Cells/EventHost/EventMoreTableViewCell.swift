//
//  EventMoreTableViewCell.swift
//  Milu
//
//  Created by Admin on 8/19/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class EventMoreTableViewCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var moreTableView: UITableView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moreTableView.dataSource = self
        moreTableView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 78
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell :UITableViewCell
        
        let moreCell = tableView.dequeueReusableCell(withIdentifier: "MoreItemCell", for: indexPath as IndexPath) as! MoreItemCell
        cell = moreCell
        return cell
    }

}
