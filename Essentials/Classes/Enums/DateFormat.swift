//
//  DateFormat.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 21/06/19.
//  Copyright © 2018 Kunal Gupta All rights reserved.
//

import Foundation

public enum DateFormat: String {
    
    case server = "yyyy-MM-dd"
    case file = "MMddHHmmss"
    case pendingCheck = "yyyy-MM-dd'T'HH:mm:ssZ"
    case standard = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    case standardTransferWise = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case dateTime = "yyyy-MM-dd HH:mm:ss"	
    
    // Display
    
    case display = "MMM dd, yyyy"
    case time = "h:mm a"
    case monthDay = "MMM dd"
    case timeDate = "hh:mm a MMMM dd"
    case timeDateYear = "hh:mm a MMMM dd, yyyy"
    case weekdayDate = "EEE, MMM dd"

}
