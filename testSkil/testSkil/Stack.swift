//
//  Stack.swift
//  testSkil
//
//  Created by Pranav V K on 10/8/18.
//  Copyright © 2018 Pranav V K. All rights reserved.
//

import Foundation

struct  Stack<T> {
    fileprivate var array = [T]()
    
    mutating func push(_ element : T) {
        self.array.append(element)
    }
    
    mutating func pop() -> T? {
        if !self.array.isEmpty {
            let poppedValue = array.removeLast()
            return poppedValue
        }
        else {
            return nil
        }
    }
    
    func peak() ->T? {
        if !self.array.isEmpty {
            return array.last
        }
        else {
            return nil
        }
    }
}
