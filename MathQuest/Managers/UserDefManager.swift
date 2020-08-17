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
    
    func readKeyboardType() -> Int {
        let type = UserDefaults().integer(forKey: "keyboardType")
        return type
    }
    
    func saveKeyboardType(type: Int) {
        UserDefaults().set(type, forKey: "keyboardType")
    }
    
//    func readCurrentLevel() -> Int {
//        let level = UserDefaults().integer(forKey: "currentLevel")
//        return level
//    }
//
//    func saveCurrentLevel(level: Int) {
//        UserDefaults().set(level, forKey: "currentLevel")
//    }
    
}
