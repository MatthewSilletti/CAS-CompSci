//
//  ViewController.swift
//  jsonDecodeApp
//
//  Created by Riley John Gibbs on 12/3/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var hobbiesLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    var jsonFileData: Data?
    var jsonFileString: String?

    // TODO: Come up with a better UI than just a single boring label.DONE
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") {
//            jsonFileData = try! Data(contentsOf: fileUrl)
//            var jsonFileData: Data!
//            var jsonFileString: String?
            
                
        let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json")
                jsonFileData = try? Data(contentsOf: fileUrl!)
                
        let json = try? JSONSerialization.jsonObject(with: jsonFileData!, options: [])
                
        let dictionary: [String: Any]? = json as? [String: Any]
                
        var name = "Butt"
        var hobbies = ["Butt"]
        var age = 13
        
        if let dictionary = dictionary {
            name = dictionary["name"] as! String
            hobbies = dictionary["hobbies"] as! [String]
            age = dictionary["age"] as! Int
        }
        myLabel.text  = "Hello, my name is \(name). I am \(age) years old. My hobbies include: \(hobbies.joined(separator: ", "))."
        //hobbiesLabel.text = "\(hobbies)"
        //ageLabel.text = "\(age)"
        
    }

}

