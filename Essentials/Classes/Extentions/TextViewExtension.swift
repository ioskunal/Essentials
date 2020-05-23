

//
//  TextViewExtension.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 07/02/19.
//  Copyright © 2019 Kunal Gupta All rights reserved.
//

import Foundation
import  UIKit

enum PayeeNoteState {
    case succeed
    case updated
    case rejectedWithMultipleSpaces
    case rejectedWithExceededLength
}

extension UITextView {
    
    func scrollToBottom(_ scrollView: UIScrollView) {
        UIView.setAnimationsEnabled(false)
        let caret = scrollView.convert(self.caretRect(for: self.selectedTextRange!.start), from: self)
        let keyboardTopBorder = self.bounds.size.height - scrollView.frame.width
        if caret.origin.y > keyboardTopBorder && self.isFirstResponder {
            scrollView.scrollRectToVisible(caret, animated: true)
        }
        UIView.setAnimationsEnabled(true)
    }
    
    func getTappedRange(_ recognizer: UITapGestureRecognizer) -> NSRange?  {
        let location: CGPoint = recognizer.location(in: self)
        let position: CGPoint = CGPoint(x: location.x, y: location.y)
        let tapPosition: UITextPosition = self.closestPosition(to: position)!
        guard let textRange: UITextRange = self.tokenizer.rangeEnclosingPosition(tapPosition, with: UITextGranularity.word, inDirection: UITextDirection(rawValue: 1)) else {return nil}
        
        let locations:Int = self.offset(from: self.beginningOfDocument, to: textRange.start)
        let length:Int = self.offset(from: textRange.start, to: textRange.end)
        let range = NSMakeRange(locations, length)
        return range
    }
}

