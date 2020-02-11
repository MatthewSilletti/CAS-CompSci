//
//  ViewController.swift
//  NewButton
//
//  Created by Matthew Silletti on 2/11/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var betterButton: NamedButton!
    @IBOutlet weak var dougButton: NamedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        betterButton.name = "Gilbert"
        dougButton.name = "Doug"
    }

    @IBAction func buttonPress(_ sender: Any) {
        let message : String
        if let sender = sender as? NamedButton {
            message = "Hi I Am \(sender.name)"
        } else {
            message = "no council member present"
        }
        let alert = UIAlertController(title: "(''>'')", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok Donnt Care Diddnt ask", style: .destructive, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

    
    
}

