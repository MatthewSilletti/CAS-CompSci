//
//  ViewController.swift
//  AppRememberer
//
//  Created by Matthew Silletti on 1/7/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var nameEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingName: String? = try? String(contentsOf: getNameFileURL())
        greetingsLabel.text = "Hello \(existingName ?? "roberto"), you have been put on the list!"
    }
    
    func getNameFileURL() -> URL {
        let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("username.txt")
    }
    
    
    @IBAction func rememberName(_ sender: Any) {
        let name = nameEntry.text!
        try! name.write(to: getNameFileURL(), atomically: true, encoding: .utf8)
        greetingsLabel.text = "Hello \(name), you have been put on the list!"
    }
    
    @IBAction func forgetName(_ sender: Any) {
        try? FileManager.default.removeItem(at: getNameFileURL())
        greetingsLabel.text = "Name Deleted"
    }
    
}

