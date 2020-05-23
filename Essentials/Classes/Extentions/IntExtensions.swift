//
//  IntExtensions.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 21/09/17.
//  Copyright © 2017 Kunal Gupta. All rights reserved.
//

import Foundation

extension Double {
    
    public var toString: String { return String(self) }
    
    func withCommas(decimal: Int = 2) -> String {
        let price = NSNumber(value: self)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = decimal // to round off to 2 digits
        numberFormatter.numberStyle = .currency
        numberFormatter.string(from: price) // "$123.44"
        numberFormatter.locale = Locale(identifier: "en_US")
        let amount = numberFormatter.string(from: price) // $123"
        return amount!
    }
    
    func cleanValue() -> String {
        let value = NSNumber(value: self)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        let amount = numberFormatter.string(from: value)
        return amount!
    }
    
    func appendDecimalPlaces(decimal: Int = 2) -> String {
        let value = NSNumber(value: self)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = decimal // to round off to 2 digits
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: value)!
    }
    
    func getSize() -> Double {
        var fileSize = self/1048576 //Convert in to MB
        fileSize = (fileSize*100).rounded()/100
        return fileSize
    }
    
    public func localeFormatted(_ currencySymbol: String? = "$", appendCurrency: Bool = true) -> String {
        let currency = appendCurrency == true ? currencySymbol : ""
        if self >= 0 {
             let amount = String.localizedStringWithFormat("%.2f", self)
             return currency! + amount
        } else {
            let amount = String.localizedStringWithFormat("%.2f", abs(self))
            return "-" + currency! + amount
        }
    }
        
}

extension NSNumber {
    
    func currencyFromatter(currencyCode: String) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.minimumFractionDigits = 2
        return formatter.string(from: self)
    }
}


extension Int {
    public var toString: String { return String(self) }
}

