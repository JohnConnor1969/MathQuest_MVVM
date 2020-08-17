//
//  FirstLaunch.swift
//  MathQuest
//
//  Created by Valeriy Pokatilo on 17.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

var firstLaunch: Bool!

public func detectFirstLaunch() {
    
    let launchedBefore = UserDefaults.standard.bool(forKey: "firstLaunch")
    if launchedBefore {
        firstLaunch = false
    } else {
        setValueForFirstLaunch()
        
        UserDefaults.standard.set(true, forKey: "firstLaunch")
        firstLaunch = true
    }
}

func setValueForFirstLaunch() {
    UserDefaults.standard.set(0, forKey: "hardLevel")
}
