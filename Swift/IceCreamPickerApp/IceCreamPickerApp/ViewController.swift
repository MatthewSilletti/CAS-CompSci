//
//  ViewController.swift
//  IceCreamPickerApp
//
//  Created by Matthew Silletti on 10/21/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var IceCreamPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    let IceCreamTypes = ["Chocolate","Vanilla","Vanilla Bean","Cotton Candy","Pumpkin Spice","Root Beer","Mocha","Half Baked"]
    
    let IceCreamPrices = ["$2.00","$2.00","$2.50","$2.50","$3.25","$2.50","$3.25","$50.00"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return IceCreamTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return IceCreamTypes[row]
    }
    @IBAction func Button(_ sender: UIButton) {
        let row = IceCreamPicker.selectedRow(inComponent: 0)
        Label.text = "You Ordered A " + IceCreamTypes[row] + " Flavored Ice Cream for - " + IceCreamPrices[row]
       }
    }

   


