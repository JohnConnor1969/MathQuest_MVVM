//
//  TaskManager.swift
//  MathQuest
//
//  Created by Valeriy Pokatilo on 16.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class TaskManager {
    static let shared = TaskManager()
        
    func createTask() -> Task {
        var arg1: Int!
        var arg2: Int!
        let level = 1
        
        let minValue = level * Int(5 * 0.3)
        let maxValue = level * 5
                
        let action = Int.random(in: 1...4)
        
        arg1 = getRandomInt(minValue: minValue, maxValue: maxValue)
        arg2 = getRandomInt(minValue: minValue, maxValue: maxValue)
        
        while (arg1 == arg2) || (arg1 * arg1 > level * 20) {
            arg1 = getRandomInt(minValue: minValue, maxValue: maxValue)
            arg2 = getRandomInt(minValue: minValue, maxValue: maxValue)
        }
        
        switch action {
        case 1:
            return Task(arg1: arg1, arg2: arg2, action: "+")
        case 2:
            return Task(arg1: arg1, arg2: arg2, action: "x")
        case 3:
            if arg1 < arg2 {
                return Task(arg1: arg2, arg2: arg1, action: "-")
            } else {
                return Task(arg1: arg1, arg2: arg2, action: "-")
            }
        case 4:
            while (arg1 % arg2 != 0){
                arg1 += 1
            }
            return Task(arg1: arg1, arg2: arg2, action: "/")
        default:
            return Task(arg1: 2, arg2: 2, action: "+")
        }
        
    }
    
    private func getRandomInt(minValue: Int, maxValue: Int) -> Int {
        return Int.random(in: minValue...maxValue)
    }
    
}
