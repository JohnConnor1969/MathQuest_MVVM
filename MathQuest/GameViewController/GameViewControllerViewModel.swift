//
//  GameViewControllerViewModel.swift
//  MathQuest
//
//  Created by Valeriy Pokatilo on 16.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class GameViewControllerViewModel: GameViewControllerViewModelProtocol {
    
    private var task: Task!
    
    var question: String {
        return task.question
    }
    
    var answer: String {
        return task.anwser
    }
    
    required init(task: Task) {
        self.task = task
    }
    
    func nextTask() {
        task = TaskManager.shared.createTask()
    }
    
    func returnKeyboardNumberArray() -> [Int] {
        let level = readKeyboardType()
        
        switch level {
        case 0:
            return KeyboardManager.shared.keyboardNumberInLine
        case 1:
            return KeyboardManager.shared.keyboardNumberInLine.shuffled()
        default:
            return KeyboardManager.shared.keyboardNumberInLine
        }
    }
    
    func changeKeyboardType(level: Int) {
        UserDefManager.shared.saveKeyboardType(level: level)
    }
    
    func readKeyboardType() -> Int {
        return UserDefManager.shared.readKeyboardType()
    }
}
