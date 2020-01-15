//
//  ViewController.swift
//  PokemonGame_App
//
//  Created by Matthew Silletti on 12/29/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//

import UIKit
   
   let fileUrl = Bundle.main.url(forResource: "pokemonList", withExtension: "json")
   let pokemonFileData = try! Data(contentsOf: fileUrl!)
   let json = try? JSONSerialization.jsonObject(with: pokemonFileData, options: [])
   let dictionary = json as! [String: Any?]

   let player1 = dictionary["Bulbasaur"] as! [String: Any]
   let player2 = dictionary["Squirtle"] as! [String: Any]

   let p1Name = player1["name"] as! String
   let p2Name = player2["name"] as! String

   let p1StatsFind = player1["stats"] as! [String: Any]
   let p2StatsFind = player2["stats"] as! [String: Any]

   let p1Attack = p1StatsFind["attack"] as! Int
   let p1Defense = p1StatsFind["defense"] as! Int
   let p1Health = p1StatsFind["health"] as! Int
   let p1Weakness = p1StatsFind["weakness"] as! String
   let p1Type = p1StatsFind["type"] as! String

   let p2Attack = p2StatsFind["attack"] as! Int
   let p2Defense = p2StatsFind["defense"] as! Int
   let p2Health = p2StatsFind["health"] as! Int
   let p2Weakness = p2StatsFind["weakness"] as! String
   let p2Type = p2StatsFind["type"] as! String

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    


}

