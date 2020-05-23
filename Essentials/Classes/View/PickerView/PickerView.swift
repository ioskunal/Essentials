//
//  PickerView.swift
//  
//
//  Created by Kunal Gupta on 24/09/18.
//

import UIKit

protocol PickerViewDelegate {
    func statePicked(state: String, code: String)
}

class PickerView: UIView {

    //MARK:- OUTLETS

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var labelTitle: UILabel!

    //MARK:- VARIABLES

    var delegate: PickerViewDelegate?
    var strTitle = ""
    var arrStates = [String]()
    var arrStateCode = [String]()
    var selectedIndex = 0

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
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(selectedIndex, inComponent: 0, animated: false)
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
        let selectdIndex = pickerView.selectedRow(inComponent: 0)
        self.delegate?.statePicked(state: arrStates[selectdIndex], code: arrStateCode[selectdIndex])
        hideViewWithAnimation()
    }

    @IBAction func actionBtnCancel(_ sender: Any) {
        hideViewWithAnimation()
    }
}

extension PickerView: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrStates.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrStates[row]
    }
}
