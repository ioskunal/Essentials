//
//  StringExtensions.swift
//  Novo
//
//  Created by Kunal Gupta on 28/10/17.
//  Copyright © 2017 Kunal Gupta. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

extension String {
    
    var isBackspace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
    
    func safelyLimitedTo(length n: Int) -> String {
        if (self.count <= n) { return self }
        AudioServicesPlaySystemSound(1519)
        return String( Array(self).prefix(upTo: n) )
    }
    
    func isValidEmail() -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", Regex.emailRegex)
        return emailPred.evaluate(with: self)
    }
    
    func isAlphaNumeric(limit: Int) -> Bool {
        let regex = "[A-Z0-9a-z. ]{0,\(limit)}"
        let text = NSPredicate(format: "SELF MATCHES %@", regex)
        return text.evaluate(with: self)
    }
    
    func attributedString(from string: String, nonBoldRange: NSRange? , color : UIColor) -> NSAttributedString {
        let attrs = [
            NSAttributedString.Key.font: NovoFont.FontMetrics(NovoFont.bold(18)),
            NSAttributedString.Key.foregroundColor: color
        ]
        let nonBoldAttribute = [
            NSAttributedString.Key.font:  NovoFont.FontMetrics(NovoFont.regular()),
        ]
        let attrStr = NSMutableAttributedString(string: string, attributes: attrs)
        if let range = nonBoldRange {
            attrStr.setAttributes(nonBoldAttribute, range: range)
        }
        return attrStr
    }
    
    func attributedString(boldWords: [String], font: UIFont? = nil) -> NSMutableAttributedString {
        
        let attributedString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: font ?? NovoFont.FontMetrics(NovoFont.regular())])
        var boldFont: UIFont
        if let font = font {
            boldFont = NovoFont.FontMetrics(NovoFont.bold(font.pointSize))
        } else {
            boldFont = NovoFont.FontMetrics(NovoFont.bold())
        }
        for word in boldWords {
            let range = NSString(string: self).range(of: word)
            attributedString.setAttributes([NSAttributedString.Key.font: boldFont], range: range)
        }
        return attributedString
    }
    
    
    mutating func replaceAllStrings(arrStrings:[String]){
        for str in arrStrings{
            self = self.replacingOccurrences(of: str, with: "")
        }
    }
    
    mutating func appendPhoneNumberFormat() {
        if self.count < 10 {
            return
        }
        self = self.replacingOccurrences(of: "+1", with: "")
        self = "+1 " + self
        self.insert("(", at: self.index(self.startIndex, offsetBy: 3))
        self.insert(")", at: self.index(self.startIndex, offsetBy: 7))
        self.insert(" ", at: self.index(self.startIndex, offsetBy: 8))
        self.insert("-", at: self.index(self.startIndex, offsetBy: 12))
    }
    
    mutating func removePhoneNumberFormat() {
        self.replaceAllStrings(arrStrings: ["+1", "(", ")", " ", "-"])
    }
    
    func initials() -> String {
        let strName = self.condenseWhitespace()
        let shortForm = strName.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
        return shortForm.uppercased()
    }
    
    func isNumber() -> Bool {
        return NumberFormatter().number(from: self) != nil ? true : false
    }
    
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespaces)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    func masked() -> String {
        if self.count > 4 {
            var newStr = " *"
            newStr += String(self.suffix(4))
            return newStr
        } else {
            return ""
        }
    }
    
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F,   // Variation Selectors
            0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
            0x1F1E6...0x1F1FF: // Flags
                return true
            default:
                continue
            }
        }
        return false
    }
    
    func containsLetter() -> Bool {
        let letterSet = CharacterSet.letters
        let lettersRange = self.rangeOfCharacter(from: letterSet)
        
        return (lettersRange != nil) ? true : false
    }
    
    func containsNumber() -> Bool {
        let numberSet = CharacterSet.decimalDigits
        let numbersRange = self.rangeOfCharacter(from: numberSet)
        return (numbersRange != nil) ? true : false
    }
    
    func containsSpecialCharacter() -> Bool {
        let characterset = CharacterSet(charactersIn: CharacterSets.passwordSet)
        return (self.rangeOfCharacter(from: characterset.inverted) != nil) ? true : false
    }
    
    func isValidPayeeCharacter() -> Bool {
        let characterset = CharacterSet(charactersIn: CharacterSets.payeeSet)
        let whiteSpaces = CharacterSet.whitespaces
        return (self.rangeOfCharacter(from: characterset) != nil || self.rangeOfCharacter(from: whiteSpaces) != nil) ? true : false
    }
    
    func currencyInputFormatting(symbol: String = "$", addCurrency: Bool = true) -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = symbol
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            let amount = "0.00"
            return addCurrency ? (symbol + amount) : amount
        }
        var strValue = formatter.string(from: number)
        strValue?.replaceAllStrings(arrStrings: [symbol," "])
        return addCurrency ? (symbol + strValue!) : strValue!
    }
    
    func getAmount(symbol: String = "$") -> Double {
        let decimalSeparator = Locale.current.decimalSeparator
        let groupingSeparator = Locale.current.groupingSeparator
        var value = self
        value.replaceAllStrings(arrStrings: [" ", symbol,groupingSeparator!,decimalSeparator!])
        
        if decimalSeparator == "." {
            let amount = value.toDouble()! * 0.01
            return Double(round(100*amount)/100)
        } else {
            let amount = Double(value)! * 0.01
            return Double(round(100*amount)/100)
        }
    }
    
    func currencySymbol() -> String {
        let locale = NSLocale(localeIdentifier: self)
        return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: self) ?? ""
    }
    
    func getDate() -> Date {
        let strDate = self
        var date = ISO8601DateFormatter().date(from: strDate)
        if date == nil {
            date = strDate.date(.standard)
        }
        return date!
    }
    
    public var length: Int {
        return self.count
    }
    
    func upperCaseFirst() -> String {
        return prefix(1).uppercased() + self.dropFirst()
    }
    
    public func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    internal func rangeFromNSRange(_ nsRange: NSRange) -> Range<String.Index>? {
        
        let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location)
        let to16 = utf16.index(from16, offsetBy: nsRange.length)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }
    
    public func matchesForRegexInText(_ regex: String!) -> [String] {
        let regex = try? NSRegularExpression(pattern: regex, options: [])
        let results = regex?.matches(in: self, options: [], range: NSRange(location: 0, length: self.count)) ?? []
        return results.map { String(self[self.rangeFromNSRange($0.range)!]) }
    }
    
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    public func addToPasteboard() {
        UIPasteboard.general.string = self
    }
    
    
    public func date(_ dateFormat: DateFormat) -> Date? {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = dateFormat.rawValue
        return dateFormate.date(from: self)
    }
    
    public func isSimilarTo(_ string: String) -> Bool {
        let result: ComparisonResult = self.compare(string, options: NSString.CompareOptions.caseInsensitive, range: nil, locale: nil)
        return result == ComparisonResult.orderedSame ? true : false
    }
    
    func toJSON() -> Any {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: [])
            } catch {
                print(error.localizedDescription)
            }
        }
        return [:]
    }
    
    func formattedNumber() -> String {
        let cleanPhoneNumber = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "(XXX) XXX-XXXX"

        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
}

extension NSMutableAttributedString {
    
    func addLineSpacing(_ lineSpacing: CGFloat) -> NSMutableAttributedString {
        
        let attributedString = NSMutableAttributedString(attributedString: self)
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = lineSpacing
        
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
}
