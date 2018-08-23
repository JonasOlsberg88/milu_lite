//
//

import UIKit
import NVActivityIndicatorView
import AVKit
import AVFoundation
import SDWebImage

extension UIViewController {
    
    func hideKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(UIViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func showLoadingHUD() {
        let activityData = ActivityData()
        
//        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, <#FadeInAnimation?#>)
        NVActivityIndicatorPresenter.sharedInstance.setMessage("Please wait...")
    }

    func hideLoadingHUD() {
//        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(FadeOutAnimation.none)
    }
    
    func isValidEmail(email:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func initBlurView(view: UIView){
        
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 0.24
        view.layer.shadowColor = UIColor.black.cgColor
    }
    
    func setImage(imageView:UIImageView){
        
        imageView.sd_setImage(with:URL(string:UserDefaults.standard.string(forKey: "photo_url")!), placeholderImage: UIImage(named: "logged_out_background.png"))
    }
    
    func fetchFirstFrameOf(videoPath filePath: URL) -> UIImage? {
        
        let asset = AVURLAsset(url: filePath, options: nil)
        let imgGenerator = AVAssetImageGenerator(asset: asset)
        imgGenerator.appliesPreferredTrackTransform = true
        
        do {
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            
            return thumbnail
            
        } catch let error {
            print("*** Error generating thumbnail: \(error)")
            return nil
        }
    }
    
    func strDate(date:Date)->String{
        
        let day = Calendar.current.component(.day, from: date)
        let month = Calendar.current.component(.month, from: date)
        let weekDay = Calendar.current.component(.weekday, from: date)
        
        let dateFormatter = DateFormatter()        
        return dateFormatter.shortWeekdaySymbols[weekDay-1] + ", " + dateFormatter.shortMonthSymbols[month-1] + " " + String(day)
    }

    func dateToString(date:Date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter.string(from: date)
    }
    
    func decode(_ s: String) -> String? {
        let data = s.data(using: .utf8)!
        return String(data: data, encoding: .nonLossyASCII)
    }
    
    func encode(_ s: String) -> String {
        let data = s.data(using: .nonLossyASCII, allowLossyConversion: true)!
        return String(data: data, encoding: .utf8)!
    }

    func appDelegate() -> AppDelegate {
        return (UIApplication.shared.delegate as? AppDelegate)!
    }

}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UnicodeScalar {
    
    var isEmoji: Bool {
        
        switch value {
        case 0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x2600...0x26FF,   // Misc symbols
        0x2700...0x27BF,   // Dingbats
        0xFE00...0xFE0F,   // Variation Selectors
        0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs
        65024...65039, // Variation selector
        8400...8447: // Combining Diacritical Marks for Symbols
            return true
            
        default: return false
        }
    }
    
    var isZeroWidthJoiner: Bool {
        
        return value == 8205
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}



