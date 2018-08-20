//
//  GoingPeopleTableViewCell.swift
//  Milu
//
//  Created by Admin on 8/19/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class GoingPeopleTableViewCell: UITableViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
    
    

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var goingCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        goingCollectionView.delegate = self
        goingCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:30,height:30)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        for i in 1...20 {
            
            if (CGFloat)(i * 30 + (i-1) * 8) > goingCollectionView.frame.width {
                
                return i-1
            }
        }
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : UICollectionViewCell?
        let peopleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoingPeopleCollectionViewCell", for: indexPath) as! GoingPeopleCollectionViewCell
        peopleCell.imgView.image = UIImage(named:"dog")
        peopleCell.imgView.layer.cornerRadius = 15
        peopleCell.imgView.layer.masksToBounds = true
        cell = peopleCell
        return cell!
    }

}
