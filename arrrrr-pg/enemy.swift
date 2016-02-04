//
//  enemy.swift
//  arrrrr-pg
//
//  Created by David Stroud on 04/02/2016.
//  Copyright © 2016 David Stroud. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["Rusty dagger", "Cracked buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
                                            // casting an integer into a UInt32 which arc4random_uniform requires
            return loot[rand]
        }
        
        return nil
        
    }
    
}