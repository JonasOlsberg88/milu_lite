//
//  PrifileViewController.swift
//  Milu
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit
import APAvatarImageView

class ProfileViewController: UIViewController,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate  {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var avatarImageView: APAvatarImageView!
    @IBOutlet private var vBounceHeader: JYBounceHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func initView(){
        avatarImageView.borderWidth = 0
        vBounceHeader.image = UIImage(named: "dog")
        
    }
    @IBAction func didTapSettings(_ sender: Any) {
        
        self.performSegue(withIdentifier: "goEditProfile", sender: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        vBounceHeader.scrollViewDidScroll(scrollView.contentOffset)
    }


    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.view.frame.width/6,height:self.view.frame.width/6)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : UICollectionViewCell?
        let connectionsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConnectisCollectionViewCell", for: indexPath) as! ConnectisCollectionViewCell      
        cell = connectionsCell
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "goConnections", sender: nil)
    }
    
}
