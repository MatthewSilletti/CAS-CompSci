//
//  ViewController.swift
//  ButtonGuessingGame
//
//  Created by Matthew Silletti on 2/12/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var buttonNumber: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Level1Button(_ sender: Any) {
        return buttonNumber = 10
        
    }
    
    @IBAction func Level2Button(_ sender: Any) {
        return buttonNumber = 20
        
    }
    
    @IBAction func Level3Button(_ sender: Any) {
        return buttonNumber = 30
        //return buttonNumber
    }
    
}


// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let vc = segue.destination as? ViewController1
    vc.buttonNumberF = buttonNumber
}


