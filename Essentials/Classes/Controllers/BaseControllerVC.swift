//
//  BaseControllerVC.swift
//  Kunal Gupta
//
//  Created by Kunal on 19/11/16.
//  Copyright © 2016 Kunal. All rights reserved.
//

import UIKit
import AudioToolbox

class BaseControllerVC: UIViewController {
    
    var appLoader: AppLoader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}
