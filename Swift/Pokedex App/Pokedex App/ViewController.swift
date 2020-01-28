//
//  ViewController.swift
//  Pokedex App
//
//  Created by Matthew Silletti on 1/23/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var weaknessField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = getFileURL() {
            let data = try? Data (contentsOf: url)
            if let data = data {
                let dict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:String]
                nameField.text = dict["name"]
                typeField.text = dict["type"]
                weaknessField.text = dict["weakness"]
            }
        }
        // Do any additional setup after loading the view.
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
            "name" : nameField.text ?? "BOOp",
            "type" : typeField.text ?? "BOop",
            "weakness" : weaknessField.text ?? "Boop"
        ]
        
        let url = getFileURL()
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) {
            try! jsonData.write(to: url!)
        } else {
            print("Save Failed Bucko")
        }
    }
    
}



// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let dest = segue.destination as! ViewController
    let indexPath = self.tableView.indexPathForSelectedRow
}



