//
//  CustomPicker.swift
//  Milu
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class CustomPicker: UIPickerView {

    @IBInspectable var selectorColor : UIColor? = nil
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        if let color = selectorColor
        {
            if subview.bounds.height <= 1.0
            {
                subview.backgroundColor = color
            }
        }
        
    }

}
