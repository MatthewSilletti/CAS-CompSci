//
//  ViewController.swift
//  LabelApp
//
//  Created by Matthew Silletti on 9/19/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var StartupLabel1: UILabel!
    @IBOutlet weak var CountingButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    var timesButtonPressed = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        StartupLabel1.text = "The Button Was Pressed - 0 - Times"
        
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        timesButtonPressed += 1
        StartupLabel1.text = "The Button Was Pressed - \(timesButtonPressed) - Times"
    }
    
    @IBAction func ResetButtonPressed(_ sender: UIButton) {
        timesButtonPressed = 0
        StartupLabel1.text = "The Button Was Pressed - \(timesButtonPressed) - Times"
    }
    
}

