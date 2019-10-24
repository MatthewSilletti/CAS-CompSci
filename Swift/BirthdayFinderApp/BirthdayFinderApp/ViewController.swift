//
//  ViewController.swift
//  BirthdayFinderApp
//
//  Created by Matthew Silletti on 9/22/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var InsertAgeLabel: UILabel!
    @IBOutlet weak var GreetingLabel: UILabel!
    @IBOutlet weak var AgeDisplay: UILabel!
    @IBOutlet weak var YearBorn: UILabel!
    var age = 0
    var currentYear = 2019
    var newAge = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GreetingLabel.text = "Follow The Steps And Find Your Age!"
    }
    @IBAction func AgePlusButton(_ sender: UIButton) {
        age += 1
        AgeDisplay.text = "\(age)"
    }
    @IBAction func AgeMinusButton(_ sender: UIButton) {
        age -= 1
        AgeDisplay.text = "\(age)"
    }
    @IBAction func YearCalculator(_ sender: UIButton) {
        let yearBorn = currentYear - age + newAge
        YearBorn.text = "You Were Born In - \(yearBorn) -"
    }
    @IBAction func BirthdaySwitch(_ sender: UISwitch) {
        if Switch.isOn {
            newAge = 0
        } else {
            newAge = -1
        }
    }
    

}

