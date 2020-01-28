//
//  ViewController1.swift
//  Pokedex App
//
//  Created by Matthew Silletti on 1/23/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController1: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var pokemon:[Pokemon] = [
        Pokemon(n: "Pikachu", t: "Electric", w: "Ground"),
        Pokemon(n: "Squirtle", t: "Water", w: "Grass"),
        Pokemon(n: "Pichu", t: "Electric", w: "Ground"),
        Pokemon(n: "Charmander", t: "Fire", w: "Water")
    ]
    
    var newPokemon:Pokemon? = nil
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let title = pokemon[indexPath.row].name
        cell.textLabel!.text = title
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func getFileURL() -> URL? {
        let docsDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        if docsDirectory != nil {
            return docsDirectory!.appendingPathComponent("saveFile.json")
        }
        return nil
    }
    
    func dictToPokemon(dict: [String:String]) -> Pokemon {
        return Pokemon(n: dict["name"] ?? "No Name", t: dict["type"] ?? "No Type", w: dict["weakness"] ?? "No Weakness")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        if let url = getFileURL() {
            let data = try? Data (contentsOf: url)
            if let data = data {
                let pokemons = try! JSONSerialization.jsonObject(with: data, options: []) as? [[String:String]] ?? []
                self.pokemon = pokemons.map(dictToPokemon(dict:))
                if newPokemon != nil {
                    self.pokemon.append(newPokemon!)
                    newPokemon = nil
                }
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ViewController2ViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        let pokemon = self.pokemon[indexPath!.row]
        print("prepared")
        dest.PName = pokemon.name
        dest.PWeakness = pokemon.weakness
        dest.PType = pokemon.type
        print("added names")
        
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     
    
}
