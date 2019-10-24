//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Matthew Silletti on 10/7/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//

import UIKit
enum modes {
    case not_set
    case addition
    case subtraction
    case multiplication
}

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didPressEquals(_ sender: UIButton) {
        guard let labelInt:Int = Int(labelString) else {
            return
        }
        
        if (currentMode == .not_set || lastButtonWasMode) {
            return
        }
        
        if (currentMode == .addition) {
            savedNum += labelInt
        }
        
        else if (currentMode == .subtraction) {
            savedNum -= labelInt
        }
        
        else if (currentMode == .multiplication) {
            savedNum *= labelInt
        }
        
        currentMode = .not_set
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    @IBAction func didPressPlus(_ sender: UIButton) {
        changeMode(newMode: .addition)
        if  lastButtonWasMode {
            labelString = "0"
        } else {
            
        }
    }
    
    @IBAction func didPressSubtract(_ sender: UIButton) {
        changeMode(newMode: .subtraction)
    }
    
    @IBAction func didPressMultiply(_ sender: UIButton) {
        changeMode(newMode: .multiplication)
    }
    
    
    @IBAction func didTouchNumber(_ sender: UIButton) {
        guard let stringValue:String = sender.titleLabel?.text else{
            Label.text = "Error"
            return
        }
        
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = "0"
        }
        
        labelString = labelString.appending(stringValue)
        updateText()
    }
    @IBAction func didPressClear(_ sender: UIButton) {
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        Label.text = "0"
    }
    
    func updateText() {
        guard let labelInt:Int = Int(labelString) else {
            return
        }
        if (currentMode == .not_set){
            savedNum = labelInt
        }
        Label.text = "\(labelInt)"
    }
    
    func changeMode(newMode:modes) {
        if (savedNum == 0) {
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
    }
    

}

