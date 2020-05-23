//
//  AlertView.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 22/04/19.
//  Copyright © 2019 Kunal Gupta All rights reserved.
//

import UIKit

class AlertView: UIView {

    //MARK:- OUTLETS

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var imageViewAlert: UIImageView!
    
    //MARK:- VARIABLES

    var colorBackground: UIColor?

    //MARK:- PREDEFINED METHODS

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {return UIView()}
        return view
    }

    func xibSetup() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }

    //MARK:- OVERRIDE FUNCTIONS

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()
    }

    //MARK:- SELF MADE

    func configureContent(title: String, body: String) {
        viewContent.transform = CGAffineTransform(translationX: 0, y: -200)
        labelTitle.text = title
        labelSubtitle.text = body
        viewContent.layer.cornerRadius = 12
        viewContent.layer.shadowColor = UIColor.lightGray.cgColor
        viewContent.layer.shadowOffset = CGSize(width: -4, height: 8)
        viewContent.layer.shadowOpacity = 0.8
        viewContent.layer.shadowRadius = 12
        showViewWithAnimation()
    }

    func showViewWithAnimation() {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: .transitionCurlUp, animations: {
            self.viewContent.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: { (_) in
            self.hideViewWithAnimation()
        })
    }

    func hideViewWithAnimation() {
        UIView.animate(withDuration: 0.75, delay: 2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: .transitionCurlUp, animations: {
            self.viewContent.transform = CGAffineTransform(translationX: 0, y: -200)
        }, completion: { (_) in
            self.removeFromSuperview()
        })
    }

}
