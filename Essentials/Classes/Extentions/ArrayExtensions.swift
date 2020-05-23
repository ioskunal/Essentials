//
//  ArrayExtensions.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 25/06/19.
//  Copyright © 2018 Kunal Gupta Financial Corp. All rights reserved.
//

import Foundation

public extension Sequence {
    
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        var categories: [U: [Iterator.Element]] = [:]
        for element in self {
            let key = key(element)
            if case nil = categories[key]?.append(element) {
                categories[key] = [element]
            }
        }
        return categories
    }
}
