//
//  ViewController.swift
//  SwapiAPI_FinalProject
//
//  Created by Matthew Silletti on 12/18/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//
// PLANETS STARSHIPS PEOPLE SPECIES
import UIKit

class ViewController: UIViewController {
    var url: URL = URL(string: "https://swapi.co/api/")!
    @IBOutlet weak var dataField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var outputLabel1: UILabel!
    @IBOutlet weak var outputLabel2: UILabel!
    @IBOutlet weak var outputLabel3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonPress(_ sender: Any) {
        let dataFieldValue = dataField.text
        let numberFieldValue = numberField.text
        if dataFieldValue != nil {
            let dataFieldValueConfirmed: String = dataFieldValue!
            if numberFieldValue != nil {
                let numberFieldDataConfirmed: String = numberFieldValue!
                let newUrl: URL = URL(string: "https://swapi.co/api/" + "\(dataFieldValueConfirmed)/" + "\(numberFieldDataConfirmed)/")!
                let responseData: Data? = try? Data(contentsOf: newUrl)
                
                if let responseData = responseData {
                    let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                        
                    if let json = json {
                        let dictionary: [String: Any]? = json as? [String: Any]
                        
                        if let dictionary = dictionary {
                            if dataFieldValueConfirmed == "planets" {
                                let name: String? = dictionary["name"] as? String
                                let climate: String? = dictionary["climate"] as? String
                                let terrain: String? = dictionary["terrain"] as? String
                                let population: String? = dictionary["population"] as? String
                                
                                if let name = name, let climate = climate, let terrain = terrain, let population = population  {
                                    outputLabel.text = "Name = \(name)"
                                    outputLabel1.text = "Climate = \(climate)"
                                    outputLabel2.text = "Terrain = \(terrain)"
                                    outputLabel3.text =  "Population = \(population)"
                                }
                            } else if dataFieldValueConfirmed == "starships" {
                                let name: String? = dictionary["name"] as? String
                                let _class: String? = dictionary["starship_class"] as? String
                                let manufacturer: String? = dictionary["manufacturer"] as? String
                                let cost: String? = dictionary["cost_in_credits"] as? String
                                
                                if let name = name, let _class = _class, let manufacturer = manufacturer, let cost = cost {
                                    outputLabel.text = "Name = \(name)"
                                    outputLabel1.text = "Class = \(_class)"
                                    outputLabel2.text = "Manufacturer = \(manufacturer)"
                                    outputLabel3.text =  "Cost = \(cost)"
                                }
                            } else if dataFieldValueConfirmed == "people" {
                                let name: String? = dictionary["name"] as? String
                                let height: String? = dictionary["height"] as? String
                                let hair_color: String? = dictionary["hair_color"] as? String
                                let birth_year: String? = dictionary["birth_year"] as? String
                                
                                if let name = name, let height = height, let hair_color = hair_color, let birth_year = birth_year {
                                    outputLabel.text = "Name = \(name)"
                                    outputLabel1.text = "Height = \(height)"
                                    outputLabel2.text = "Hair Color = \(hair_color)"
                                    outputLabel3.text =  "Birth Year = \(birth_year)"
                                }
                            } else if dataFieldValueConfirmed == "species" {
                                let name: String? = dictionary["name"] as? String
                                let c: String? = dictionary["classification"] as? String
                                let d: String? = dictionary["designation"] as? String
                                let l: String? = dictionary["language"] as? String
                                
                                if let name = name, let c = c, let d = d, let l = l {
                                outputLabel.text = "Name = \(name)"
                                outputLabel1.text = "Classification = \(c)"
                                outputLabel2.text = "Designation Color = \(d)"
                                outputLabel3.text =  "Language = \(l)"
                                }
                            }
                        } else { outputLabel.text = "poop4" }
                    } else { outputLabel.text = "poop3" }
                } else { outputLabel.text = "poop2" }
            } else { outputLabel.text = "poop1" }
        }
    }
}

