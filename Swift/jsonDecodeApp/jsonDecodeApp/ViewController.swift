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
    
    var jsonFileData: Data?
    var jsonFileString: String?

    // TODO: Come up with a better UI than just a single boring label.DONE
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") {
//            jsonFileData = try! Data(contentsOf: fileUrl)
//            var jsonFileData: Data!
//            var jsonFileString: String?
            
            func main() -> (String, [String], Int){
                
                let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json")
                jsonFileData = try! Data(contentsOf: fileUrl!)
                
                var jsonFileData: Data!
                
                var jsonFileString: String?
                
                let json = try? JSONSerialization.jsonObject(with: jsonFileData, options: [])
                
                let dictionary: [String: Any] = json as! [String: Any]
                
                let name: String = dictionary["name"] as! String
                let hobbies: [String] = dictionary["hobbies"] as! [String]
                let age: Int = dictionary["age"] as! Int
                
                
            return (name, hobbies, age)
        }
        myLabel.text  = "\(name)"
    }

}

