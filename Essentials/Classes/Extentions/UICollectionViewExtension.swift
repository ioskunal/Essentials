//
//  UICollectionViewExtension.swift
//  Kunal Gupta
//
//  Created by Dharmesh on 19/11/19.
//  Copyright © 2019 Kunal Gupta Financial Corp. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func register(identifier:String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
}
