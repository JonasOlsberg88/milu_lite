//
//  EditProfilePhotoViewController.swift
//  Milu
//
//  Created by Admin on 8/23/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit
import KUIActionSheet

protocol EditProfilePhotoViewControllerDelegate
{
    
    func cropDidCancel()
    func cropDidCropImage(_ image: UIImage)
    
}

class EditProfilePhotoViewController: UIViewController,UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var contentView: UIView!
    
    let imagePicker = UIImagePickerController()
    let imageView = UIImageView()
    let scrollView = KARectCropScrollView(frame: CGRect(x: 0, y: 0, width: 240, height: 240))
    
    var delegate: EditProfilePhotoViewControllerDelegate?
    let cutterView = KACircleCropCutterView()
    var coverImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        coverImage = UIImage(named: "dog.jpg")!
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        if coverImage.size.width < self.view.bounds.size.width {
            coverImage = coverImage.resizedImage(newSize: CGSize(width: self.view.bounds.size.width, height: coverImage.size.height * self.view.bounds.size.width / coverImage.size.width))
        }
        
        imageView.image = coverImage
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(origin: CGPoint.zero, size: coverImage.size)
        self.scrollView.addSubview(imageView)
        scrollView.delegate = self
        
        scrollView.contentSize = coverImage.size
        scrollView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height)
        
        
        let scaleWidth = scrollView.frame.size.width / scrollView.contentSize.width
        scrollView.minimumZoomScale = scaleWidth
        if imageView.frame.size.width < scrollView.frame.size.width {
            print("We have the case where the frame is too small")
            scrollView.maximumZoomScale = scaleWidth * 3
        } else {
            scrollView.maximumZoomScale = 1.0
        }
        scrollView.maximumZoomScale = scaleWidth * 3
        scrollView.zoomScale = scaleWidth
        
        //Center vertically
        scrollView.contentOffset = CGPoint(x: 0, y: (scrollView.contentSize.height - scrollView.frame.size.height)/2)
        scrollView.clipsToBounds = true
        
        
        //Add in the black view. Note we make a square with some extra space +100 pts to fully cover the photo when rotated
        cutterView.frame = contentView.frame
        //        cutterView.frame.size.height += 100
        //        cutterView.frame.size.width = cutterView.frame.size.height
        //        self.scrollView.center = self.contentView.center
        // cutterView.center = self.view.center
        self.contentView.addSubview(scrollView)
        self.view.addSubview(cutterView)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        
        coordinator.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            self.scrollView.center = self.view.center
            self.cutterView.center = self.view.center
            // self.setLabelAndButtonFrames()
            
        }) { (UIViewControllerTransitionCoordinatorContext) -> Void in
        }
        
        
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func didTapOk() {
        
        let image = coverImage
        
        let newSize = CGSize(width: (image.size.width)*scrollView.zoomScale, height: (image.size.height)*scrollView.zoomScale)
        
        let offset = scrollView.contentOffset
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.view.bounds.size.width - 30, height: (self.view.bounds.size.width - 30)*0.8), false, 0)
        let circlePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: self.view.bounds.size.width - 30, height: (self.view.bounds.size.width - 30) * 0.8))
        circlePath.addClip()
        var sharpRect = CGRect(x: -offset.x, y: -offset.y-60, width: newSize.width, height: newSize.height)
        sharpRect = sharpRect.integral
        
        image.draw(in: sharpRect)
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let imageData = UIImagePNGRepresentation(finalImage!) {
            if let pngImage = UIImage(data: imageData) {
                delegate?.cropDidCropImage(pngImage)
            } else {
                delegate?.cropDidCancel()
            }
        } else {
            delegate?.cropDidCancel()
        }
        
    }
    @IBAction func okPress(_ sender: Any) {
        didTapOk()
    }
    
    @IBAction func didTapOnChoosePhoto(_ sender: Any) {
        
        let actionSheet = KUIActionSheet.view(parentViewController: self)
        actionSheet?.add(item: KUIActionSheetItem(title: "Take a Photo", destructive: false) { [weak self] (item) in
            
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
                self?.imagePicker.allowsEditing = false
                self?.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                self?.imagePicker.cameraCaptureMode = .photo
                self?.imagePicker.modalPresentationStyle = .fullScreen
                self?.present((self?.imagePicker)!,animated: true,completion: nil)
                
            }else{
                
                let alert = UIAlertController(title: "Warning", message: "You can't use camera", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
            
            print(item.title)
        })
        actionSheet?.add(item: KUIActionSheetItem(title: "Select From Gallery", destructive: false) { [weak self] (item) in
            
            self?.imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self?.imagePicker.allowsEditing = true
            self?.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self?.present((self?.imagePicker)!, animated: true, completion: nil)
            print(item.title)
        })
        //        actionSheet?.theme.itemTheme.font = UIFont(name: "WorkSans-Light", size: 16)
        actionSheet?.show()
    }
    
    //MARK: imagePickerViewControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage
        {
            self.coverImage = image
            
        }
        else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            self.coverImage = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func backAction(_ sender: Any) {
        self.delegate?.cropDidCancel()
    }
    
}


