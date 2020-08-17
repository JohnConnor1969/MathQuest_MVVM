//
//  GameViewControllerViewModelProtocol.swift
//  MathQuest
//
//  Created by Valeriy Pokatilo on 16.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

protocol GameViewControllerViewModelProtocol {
    var question: String { get }
    var answer: String { get }
    
    init(task: Task)
    
    func nextTask()
        
    func returnKeyboardNumberArray() -> [Int]
    
    func changeHardLevel(level: Int)
    
    func readHardLevel() -> Int
}
