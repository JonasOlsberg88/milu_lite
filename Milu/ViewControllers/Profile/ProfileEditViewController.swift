//
//  ProfileEditViewController.swift
//  Milu
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit
import MultilineTextField

class ProfileEditViewController: UIViewController,EditCoverPhotoViewControllerDelegate,EditProfilePhotoViewControllerDelegate {
    

    @IBOutlet weak var headerView: UIVisualEffectView!

    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var quoteField: MultilineTextField!
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    func initView(){
        
        self.headerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.headerView.layer.shadowRadius = 2
        self.headerView.layer.shadowOpacity = 0.24
        self.headerView.layer.shadowColor = UIColor.black.cgColor
        
        //  self.hideKeyboardOnTap()
        
        fullNameField.attributedPlaceholder = NSAttributedString(string: "full name",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        userNameField.attributedPlaceholder = NSAttributedString(string: "username",
                                                                 attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        quoteField.placeholderColor = UIColor.lightGray
    }
    
    @IBAction func didTapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapOnLogout(_ sender: Any) {        
        
        let signinViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SigninViewController") as? SigninViewController
        self.appDelegate().window?.rootViewController = signinViewController
        
    }
    
    
    @IBAction func didTapOnChangeCoverPhoto(_ sender: Any) {
        
        let editCoverPhotoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditCoverPhotoViewController") as? EditCoverPhotoViewController
        editCoverPhotoViewController?.delegate = self
        self.navigationController?.pushViewController(editCoverPhotoViewController!, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func circleCropDidCancel() {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func circleCropDidCropImage(_ image: UIImage) {
        coverPhotoImageView.image = image
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func didTapChangeProfilePhoto(_ sender: Any) {
        
        let editProfilePhotoViewController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "EditProfilePhotoViewController") as? EditProfilePhotoViewController
        editProfilePhotoViewController?.delegate = self
        self.navigationController?.pushViewController(editProfilePhotoViewController!, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func cropDidCancel() {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func cropDidCropImage(_ image: UIImage) {
        profilePhotoImageView.image = image
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
