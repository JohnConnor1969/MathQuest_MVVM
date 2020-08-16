//
//  TaskModel.swift
//  MathQuest
//
//  Created by Valeriy Pokatilo on 16.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class Task {
    let arg1: Int
    let arg2: Int
    let action: Character
    var question: String{
        return "\(arg1) \(action) \(arg2)"
    }
    
    var anwser: String {
        switch action {
        case "+": return String(arg1 + arg2)
        case "-": return String(arg1 - arg2)
        case "x": return String(arg1 * arg2)
        case "/": return String(arg1 / arg2)
        default:
            return ""
        }
    }
    
    init(arg1: Int, arg2: Int, action: Character) {
        self.arg1 = arg1
        self.arg2 = arg2
        self.action = action
    }
}
