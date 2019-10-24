//
//  ViewController.swift
//  Pizza Picker App
//
//  Created by Matthew Silletti on 10/16/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaTypes[row]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var pizzaPicker: UIPickerView!
    
    @IBOutlet weak var pizzaLabel: UILabel!
    
    let pizzaTypes = ["Cheese", "Pepperoni", "Margarita", "Barbecue Chicken", "Vegetarian"]
    
    @IBAction func pizzaButton(_ sender: UIButton) {
        let row = pizzaPicker.selectedRow(inComponent: 0)
        pizzaLabel.text = "You Ordered A "+pizzaTypes[row]
    }
}

