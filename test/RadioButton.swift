//
//  RadioButton.swift
//  test
//
//  Created by dsj on 2018/12/25.
//  Copyright © 2018年 dsj. All rights reserved.
//

import UIKit

class RadioButton: UIButton {
    
    var alternateButton: Array<RadioButton>?
    
    override func awakeFromNib() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = self.layer.bounds.width / 2
        self.layer.masksToBounds = true
        
        self.tintColor = UIColor.white
        self.setBackgroundColor(.white, for: .normal)
        self.setBackgroundColor(.red, for: .selected)
    }
    
    func unselectAlternateButtons(){
        if alternateButton != nil {
            self.isSelected = true
            
            NotificationCenter.default.post(name: Notification.Name("buttonSelectedNotification"), object: nil, userInfo:["tag": self.tag])
            
            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        }else{
            toggleButton()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton(){
        self.isSelected = !isSelected
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderColor = UIColor.red.cgColor
                self.layer.cornerRadius = self.layer.bounds.width / 2
                self.layer.borderWidth = 2.0
                self.layer.masksToBounds = true
                
            } else {
                self.layer.borderColor = UIColor.lightGray.cgColor
                self.layer.cornerRadius = 5
                self.layer.borderWidth = 2.0
                self.layer.cornerRadius = self.layer.bounds.width / 2
                self.layer.masksToBounds = true
            }
        }
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControlState) {
        let image = color.image
        setBackgroundImage(image, for: state)
    }
}

extension UIColor {
    var image: UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setFillColor(self.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
