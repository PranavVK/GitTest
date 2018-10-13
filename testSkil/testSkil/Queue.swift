//
//  Queue.swift
//  testSkil
//
//  Created by Pranav V K on 10/8/18.
//  Copyright © 2018 Pranav V K. All rights reserved.
//

import Foundation

struct Queue<T> {
    var list = [T]()
    
    mutating func enqueue(_ element : T) {
        list.append(element)
    }
    
    mutating func dequeue() ->T? {
        if !list.isEmpty {
            return list.removeFirst()
        }
        else {
            return nil
        }
    }
    
    func peak() -> T? {
        if !list.isEmpty {
            return list.first
        }
        else {
            return nil
        }
    }
    
    var isEmpty : Bool {
        return list.isEmpty
    }
}
