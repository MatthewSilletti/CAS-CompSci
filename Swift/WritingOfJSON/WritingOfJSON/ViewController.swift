//
//  ViewController.swift
//  WritingOfJSON
//
//  Created by Matthew Silletti on 1/9/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var battleInput: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = getFileURL() {
            let data = try? Data (contentsOf: url)
            if let data = data {
                let dict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:String]
                nameInput.text = dict["name"]
                dateInput.text = dict["date"]
                battleInput.text = dict["enemies"]
            }
        }
    }
    
    func getFileURL() -> URL? {
        let docsDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        if docsDirectory != nil {
            return docsDirectory!.appendingPathComponent("saveFile.json")
        }
        return nil
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let data: [String:String] = [
            "name": nameInput.text ?? "Boop",
            "date": dateInput.text ?? "Bop",
            "enemies": battleInput.text ?? "Yeep"
        ]
        
        let url = getFileURL()
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) {
            try! jsonData.write(to: url!)
        } else {
            print("Save Failed Bucko")
        }
    }
    
    @IBAction func loadAction(_ sender: Any) {
        
    }
}

