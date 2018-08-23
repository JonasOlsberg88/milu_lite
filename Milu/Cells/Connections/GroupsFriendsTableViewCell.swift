//
//  GroupsFriendsTableViewCell.swift
//  Milu
//
//  Created by Admin on 8/23/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class GroupsFriendsTableViewCell: UITableViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.frame.width/6,height:self.frame.width/6)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : UICollectionViewCell?
        let connectionsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendCell", for: indexPath) as! ConnectisCollectionViewCell
        cell = connectionsCell
        return cell!
    }
}
