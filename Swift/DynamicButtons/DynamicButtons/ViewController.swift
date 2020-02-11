//
//  ViewController.swift
//  DynamicButtons
//
//  Created by Matthew Silletti on 2/7/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var alertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alertButton.addTarget(self, action: #selector(addButton), for: .touchUpInside)
    }
    
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Hi There!", message: "How are you?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "F", style: .default, handler: {(_) in return}))
        alert.addAction(UIAlertAction(title: "H", style: .destructive, handler: {(_) in return}))
        
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func addButton() {
        let newButton = UIButton()
        newButton.setTitle("Poop", for: .normal)
        newButton.setTitleColor(UIColor(displayP3Red: 1, green: 0.5, blue: 0.25, alpha: 0.75), for: .normal)
        newButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        stackView.addArrangedSubview(newButton)
    }


}

