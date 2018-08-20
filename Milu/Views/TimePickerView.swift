//
//  TimePickerView.swift
//  cc
//
//  Created by Jayson Lane on 6/21/16.
//

import UIKit

protocol TimePickerViewDelegate : class {
    func timePickerChangedValue(_ timePicker: TimePickerView)
}

class TimePickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    var hour: Int = 0
    var minutes: Int = 0
    var inputField: UITextField?
    var timeDelegate: TimePickerViewDelegate?
    var selectorColor : UIColor? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        self.selectorColor = UIColor.white
        if let color = selectorColor
        {
            if subview.bounds.height <= 1.0
            {
                subview.backgroundColor = color
            }
        }
        
    }
    
    func setup(){
        self.delegate = self
        self.dataSource = self   
        self.backgroundColor = UIColor.clear
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            self.hour = row
        case 2:
            self.minutes = row
        default:
            break
        }
        
        timeDelegate?.timePickerChangedValue(self)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 1 || component == 3 {
            return 1
        }
        
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        if let view = view as? UILabel {
            if component == 1 {
                view.text = "hours"
            } else if component == 3 {
                view.text = "minutes"
            } else {
                view.text = String(format:"%0lu", row)
            }
            view.textColor = UIColor.white
            return view
        }

        let columnView = UILabel(frame: CGRect(x: 35, y: 0, width: self.frame.size.width/3 - 35, height: 30))
        
        if component == 1 {
            columnView.text = "hours"
        } else if component == 3 {
            columnView.text = "minutes"
        } else {
            columnView.text = String(format:"%0lu", row)
        }
        
        columnView.textAlignment = .center
        columnView.textColor = UIColor.white
        return columnView
    }
  
    
}
