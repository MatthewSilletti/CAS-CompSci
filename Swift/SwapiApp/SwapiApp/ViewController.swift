//
//  ViewController.swift
//  SwapiApp
//
//  Created by Matthew Silletti on 12/11/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressOne(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/1/")!
        let responseData: Data? = try? Data(contentsOf: url)
        
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let id: String? = dictionary["opening_crawl"] as? String
                    
                    if let title = title{
                         myLabel.text = ("\(title)" + "             " + "\(id)")
                    }
                   
                }
                
            }
            
        }
        
    }
    
    @IBAction func presstwo(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/2/")!
               let responseData: Data? = try? Data(contentsOf: url)
               
               if let responseData = responseData {
                   let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                   
                   if let json = json {
                       let dictionary: [String: Any]? = json as? [String: Any]
                       
                       if let dictionary = dictionary {
                           let title: String? = dictionary["title"] as? String
                           let id: String? = dictionary["opening_crawl"] as? String
                           
                           if let title = title{
                            myLabel.text = ("\(title)" + "             " + "\(id)")
                            
                    }
                }
            }
        }
    }
    @IBAction func pressThree(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/6/")!
        let responseData: Data? = try? Data(contentsOf: url)
               
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                   
                if let json = json {
                    let dictionary: [String: Any]? = json as? [String: Any]
                       
                    if let dictionary = dictionary {
                        let title: String? = dictionary["title"] as? String
                        let id: Int? = dictionary["episode_id"] as? Int
                           
                        if let title = title{
                                myLabel.text = ("\(title)" + "             " + "\(id)")
                    }
                }
            }
        }
    }
}

