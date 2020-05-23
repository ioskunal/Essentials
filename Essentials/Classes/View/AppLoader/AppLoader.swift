//
//  AppLoader.swift
//  PowWow
//
//  Created by cbl20 on 7/29/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class AppLoader: UIView {
    
    //MARK:- OUTLETS
    
    @IBOutlet var loader: UIActivityIndicatorView!
    
    //MARK:- VARIABLES
    
    static var alertWindow: UIWindow? = nil
    
    //MARK:- FUNCTIONS
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AppLoader", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {return UIView()}
        return view
    }
    
    func xibSetup() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
        loader.startAnimating()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActiveNotification), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    //MARK:- OVVERIDE FUNCTIONS
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()
    }
    
    static func show() {
        if alertWindow == nil {
            alertWindow = UIWindow.init(frame: UIScreen.main.bounds)
            alertWindow?.windowLevel = UIWindow.Level(UIWindow.Level.alert.rawValue)
            alertWindow?.makeKeyAndVisible()
            alertWindow?.addSubview(AppLoader(frame: UIScreen.main.bounds))
        }
    }
    
    static func hide() {
        alertWindow?.resignKey()
        alertWindow = nil
    }
    
//    @objc private func didBecomeActiveNotification(_ sender: Any) {
//        guard let loader = AppLoader.alertWindow?.subviews.first(where: {$0 is AppLoader}) as? AppLoader else {return}
//        if !loader.animationView.isAnimationPlaying {
//            loader.animationView.play()
//        }
//    }
    
    // MARK: - DEINIT
    
//    deinit {
//        NotificationCenter.default.removeObserver(self, name: UIApplication.willResignActiveNotification, object: nil)
//    }
}
