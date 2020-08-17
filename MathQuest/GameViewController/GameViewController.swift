//
//  GameViewController.swift
//  MathQuest
//
//  Created by Valeriy Pokatilo on 16.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var buttonArray: [UIButton]!
    
    @IBOutlet var hardLevel: UISegmentedControl!
    
    // MARK: - Properties
    
    var viewModel = GameViewControllerViewModel(task: Task(arg1: 1, arg2: 1, action: "+"))
    
    // MARK: - Lifecycle app
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI(appIsOn: false)
        setupKeyboard()
    }
    
    // MARK: - IB Action
    
    @IBAction func hardLevelChanged(_ sender: UISegmentedControl) {
        viewModel.changeKeyboardType(level: sender.selectedSegmentIndex)
        setupKeyboard()
    }
    

    @IBAction func startAction(_ sender: UIBarButtonItem) {
        setupUI(appIsOn: true)
        setupKeyboard()
        
        nextTask()
    }
    
    @IBAction func stopAction(_ sender: UIBarButtonItem) {
        setupUI(appIsOn: false)
    }
    
    @IBAction func buttonArrayAction(_ sender: UIButton) {
        let pressedNumber = String(sender.tag)
        
        switch sender.tag {
        case 0: answerLabel.text! += pressedNumber
        case 1: answerLabel.text! += pressedNumber
        case 2: answerLabel.text! += pressedNumber
        case 3: answerLabel.text! += pressedNumber
        case 4: answerLabel.text! += pressedNumber
        case 5: answerLabel.text! += pressedNumber
        case 6: answerLabel.text! += pressedNumber
        case 7: answerLabel.text! += pressedNumber
        case 8: answerLabel.text! += pressedNumber
        case 9: answerLabel.text! += pressedNumber
        default:
            break
        }
        
        let answerLenght = answerLabel.text?.count
        if (answerLenght! > 4) || (answerLabel.text == "0") {
            clearAnswer()
        }
        
        
         if answerLabel.text == viewModel.answer {
             
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                 
                self.nextTask()
            }
            
            if hardLevel.selectedSegmentIndex == 1 {
                setupKeyboard()
            }
             
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.prepare()
            generator.impactOccurred()
         }
         
    }
    
    // MARK: - Functions
    
    private func setupUI(appIsOn: Bool) {
        var textColor: UIColor!
        var buttonColor: UIColor!
        
        if appIsOn {
            textColor = .black
            buttonColor = .systemTeal
        } else {
            textColor = .lightGray
            buttonColor = .lightGray
            
            questionLabel.text = "XXXX"
            answerLabel.text = "XX"
        }
        
        questionLabel.textColor = textColor
        answerLabel.textColor = textColor
        
        for button in buttonArray {
            button.isEnabled = appIsOn
            button.backgroundColor = buttonColor
        }
        
        hardLevel.selectedSegmentIndex = viewModel.readKeyboardType()
    }
    
    private func setupKeyboard() {
        let numberArray = viewModel.returnKeyboardNumberArray()
        
        for (button, index) in zip(buttonArray, numberArray){
            button.setTitle(String(index), for: .normal)
            button.tag = index
        }
    }
    
    private func clearAnswer() {
        answerLabel.text = ""
    }
    
    private func nextTask() {
        viewModel.nextTask()
        questionLabel.text = self.viewModel.question
        clearAnswer()
    }
}

