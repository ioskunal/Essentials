//
//  UIBUttonExtensions.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 04/07/18.
//  Copyright © 2018 Kunal Gupta All rights reserved.
//

import Foundation
import  UIKit

extension UIButton {
    
    @IBInspectable var characterSpacing : CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = self.titleLabel?.attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            } else {
                attributedString = NSMutableAttributedString(string: self.titleLabel?.text ?? "")
                self.titleLabel?.text = nil
            }
            attributedString.addAttribute(NSAttributedString.Key.kern,value: newValue,range: NSRange(location: 0, length: attributedString.length))
            self.titleLabel?.attributedText = attributedString
        }
        get {
            if let currentLetterSpace = self.titleLabel?.attributedText?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            } else {
                return 0
            }
        }
    }
    
    public func setBackgroundColor(_ color: UIColor, forState: UIControl.State) {
          UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
          UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
          UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
          let colorImage = UIGraphicsGetImageFromCurrentImageContext()
          UIGraphicsEndImageContext()
          self.setBackgroundImage(colorImage, for: forState)
      }
}

extension UIBarButtonItem {

    func setHidden(_ bool: Bool) {
        self.isEnabled = !bool
        self.tintColor = bool ? UIColor.clear : nil
    }
}
