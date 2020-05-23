//
//  UIViewControllerExtension.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 12/03/19.
//  Copyright © 2019 Kunal Gupta Financial Corp. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func log(_ message: String) {
        #if DEBUG
        print(message)
        #endif
    }
    
    open func alert(_ title: String = "Whoops!", message: String) {
        let alert = EZAlertController.alert(title, message: message)
        alert.show(self, sender: nil)
    }
    
    open func popToRootVC() {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    open func presentVC(_ vc: UIViewController) {
        present(vc, animated: true, completion: nil)
    }
    
    open func dismissVC(completion: (() -> Void)? ) {
        dismiss(animated: true, completion: completion)
    }
    
    open func pushVC(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}
