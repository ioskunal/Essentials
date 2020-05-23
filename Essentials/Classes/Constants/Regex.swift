//
//  Regex.swift
// Kunal Gupta
//
//  Created by Kunal Gupta on 05/11/19.
//  Copyright © 2019 Kunal Gupta All rights reserved.
//

import Foundation

//MARK:- REGEX

struct Regex {
    
    static let phoneRegex = "[789][0-9]{9}"
    static let nameRegex = "[a-zA-Z\\s][a-zA-Z\\s\\.]*"
    static let emailRegex = "[A-Z0-9a-z]+[A-Z0-9a-z._+-]*@([A-Za-z0-9]+[A-Za-z0-9-]*\\.)+[A-Za-z]{2,64}"
    static let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*()-=_+{}|:\"<>?\\[\\\\\\];',./~ `])[A-Za-z\\d!@#$%^&*()-=_+{}|:\"<>?\\[\\\\\\];',./~ `]{8,30}$"
}
