//
//  KACircleCropCutterView.swift
//  Circle Crop View Controller
//
//  Created by Keke Arif on 21/02/2016.
//  Copyright © 2016 Keke Arif. All rights reserved.
//

import UIKit

class KARectCropCutterView: UIView {
    
    override var frame: CGRect {
        
        didSet {
            setNeedsDisplay()
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isOpaque = false
    }
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7).setFill()
        UIRectFill(rect)
        
        //This is the same rect as the UIScrollView size 240 * 240, remains centered
        let circle = UIBezierPath(rect: CGRect(x: rect.size.width/2 - (rect.size.width-30)/2, y: rect.size.height/2 - (rect.size.width-30) * 0.8/2, width: (rect.size.width-30), height: (rect.size.width-30) * 0.8))
        context?.setBlendMode(.clear)
        UIColor.clear.setFill()
        circle.fill()
        
        //This is the same rect as the UIScrollView size 240 * 240, remains centered
        let square = UIBezierPath(rect: CGRect(x: rect.size.width/2 - (rect.size.width-30)/2, y: rect.size.height/2 - (rect.size.height-100)/2, width: (rect.size.width-30), height: (rect.size.height-100)))
        UIColor.lightGray.setStroke()
        square.lineWidth = 0
        context?.setBlendMode(.normal)
        square.stroke()
        
    }
    
    //Allow touches through the circle crop cutter view
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if !subview.isHidden && subview.alpha > 0 && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }
    
}
