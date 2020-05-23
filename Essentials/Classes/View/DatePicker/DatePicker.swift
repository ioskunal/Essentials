//
//  DatePicker.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 13/09/18.
//  Copyright © 2018 Kunal Gupta All rights reserved.
//

import UIKit

@objc protocol DatePickerDelegate {
    @objc optional func datePicked(date: Date)
    @objc optional func datePickedWithIndex(date: Date, indexPath: IndexPath)
}

class DatePicker: UIView {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var labelTitle: UILabel!
    
    //MARK:- VARIABLES
    
    var delegate: DatePickerDelegate?
    var minimumDate: Date?
    var maximumDate: Date?
    var selectedDate: Date?
    var strTitle = ""
    var indexPath: IndexPath?
    
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
        initialise()
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
    
    func initialise() {
        viewContent.transform = CGAffineTransform(translationX: 0, y: 800)
        viewBackground.backgroundColor = UIColor.clear
        showViewWithAnimation()
        self.setValues()
    }
    
    func setValues() {
        if let dateSelected = selectedDate {
            datePicker.setDate(dateSelected, animated: true)
        }
        labelTitle.text = strTitle
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
    }
    
    func showViewWithAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: .transitionCurlUp, animations: {
            self.viewContent.transform = CGAffineTransform(translationX: 0, y: 0)
            self.viewBackground.backgroundColor = UIColor(white: 100/255, alpha: 0.5)
        }, completion: nil)
    }
    
    func hideViewWithAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: .transitionCurlUp, animations: {
            self.viewContent.transform = CGAffineTransform(translationX: 0, y: 800)
            self.viewBackground.backgroundColor = UIColor.clear
        }, completion: { (completed) in
            self.removeFromSuperview()
        })
    }
    
    //MARK:- ACTION BUTTONS
    
    @IBAction func actionBtnDone(_ sender: Any) {
        if let index = indexPath {
            self.delegate?.datePickedWithIndex?(date: datePicker.date, indexPath: index)
        } else {
            self.delegate?.datePicked?(date: datePicker.date)
        }
        hideViewWithAnimation()
    }
    
    @IBAction func actionBtnCancel(_ sender: Any) {
        hideViewWithAnimation()
    }
}
