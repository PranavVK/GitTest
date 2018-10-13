//
//  BLEService.swift
//  testSkil
//
//  Created by Pranav V K on 6/2/18.
//  Copyright © 2018 Pranav V K. All rights reserved.
//

import Foundation


class BLEService {
    
    
    private static var sharedBLE : BLEService = {
        let bleObj = BLEService()
        return bleObj
    }()
    
    class func defaultConfig() -> BLEService {
        return sharedBLE
    }
    
    
    
    
}
