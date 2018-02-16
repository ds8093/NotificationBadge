//
//  P2Badge.swift
//  P2Badge
//
//  Created by Deepak on 16/02/18.
//  Copyright © 2018 Position2. All rights reserved.
//

import Foundation
import UIKit
extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
}
class P2Badge: UIView {
    
    var badgeBackgroundColor = UIColor.red
    var textColor = UIColor.black
    var inputText:String?
    var fontSize = 18.0
    
    func createBadge(_ onScreen: UIView)-> UITextField {
        let textField = UITextField()
        if let bText = inputText {
            let attribute = [NSAttributedStringKey.font: (UIFont.init(name: "Arial", size: CGFloat(fontSize)))!]
            
            let attributeString = NSAttributedString.init(string: bText, attributes: attribute)

            var w = bText.widthOfString(usingFont: (UIFont.init(name: "Arial", size: CGFloat(fontSize + 3)))!)
            var h = bText.heightOfString(usingFont: (UIFont.init(name: "Arial", size: CGFloat(fontSize + 3)))!)
            textField.text = bText
            textField.attributedText = attributeString
            
            let onScreenX = onScreen.bounds.origin.x + onScreen.bounds.size.width - w/2 - 5
            let onScreenY = onScreen.bounds.origin.y - h/2 + 2
            
            
            if w<h{
                w = h
            }
            
            textField.frame = CGRect.init(x: onScreenX, y: onScreenY, width: w, height: h)
            textField.textAlignment = .center
            textField.layer.cornerRadius = h/2
            textField.textColor = textColor
            textField.backgroundColor = badgeBackgroundColor
        }
        
        return textField
    }
    
    
    
    
    
    
}
