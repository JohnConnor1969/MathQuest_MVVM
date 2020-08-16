//
//  GameViewController.swift
//  MathQuest
//
//  Created by Valeriy Pokatilo on 16.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var buttonArray: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI(appIsOn: false)
    }

    @IBAction func startAction(_ sender: UIBarButtonItem) {
        setupUI(appIsOn: true)
    }
    
    @IBAction func stopAction(_ sender: UIBarButtonItem) {
        setupUI(appIsOn: false)
    }
    
    @IBAction func buttonArrayAction(_ sender: UIButton) {
        
    }
    
    private func setupUI(appIsOn: Bool) {
        var textColor: UIColor!
        var buttonColor: UIColor!
        
        if appIsOn {
            textColor = .black
            buttonColor = .systemTeal
        } else {
            textColor = .lightGray
            buttonColor = .lightGray
        }
        
        questionLabel.textColor = textColor
        answerLabel.textColor = textColor
        
        for button in buttonArray {
            button.isEnabled = appIsOn
            button.backgroundColor = buttonColor
        }
    }
    
}

