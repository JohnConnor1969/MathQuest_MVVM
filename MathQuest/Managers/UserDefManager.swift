//
//  UserDefManager.swift
//  MathQuest
//
//  Created by Valeriy Pokatilo on 17.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class UserDefManager {
    
    static let shared = UserDefManager()
    
    func readHardLevel() -> Int {
        let level = UserDefaults().integer(forKey: "hardLevel")
        return level
    }
    
    func saveHardLevel(level: Int) {
        UserDefaults().set(level, forKey: "hardLevel")
    }
    
}
