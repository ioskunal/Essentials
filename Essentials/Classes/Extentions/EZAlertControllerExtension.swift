//
//  EZAlertControllerExtension.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 16/09/17.
//  Copyright © 2017 Kunal Gupta. All rights reserved.
//

import Foundation
import  UIKit

extension UIAlertController {
    
    func addCancelButton(handler: ((UIAlertAction) -> Void)? = nil) {
        self.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: handler))
    }
}
