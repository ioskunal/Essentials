//
//  TimerExtensions.swift
//  EZSwiftExtensions
//
//  Created by Lucas Farah on 15/07/15.
//  Copyright (c) 2016 Lucas Farah. All rights reserved.
//

import Foundation

extension Timer {
    
    public static func runThisEvery(seconds: TimeInterval, handler: @escaping (Timer?) -> Void) -> Timer {
        let fireDate = CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, seconds, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)
        return timer!
    }

}
