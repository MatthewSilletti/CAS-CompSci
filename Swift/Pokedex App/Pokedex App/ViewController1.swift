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
    
    
      let pokemon:[Pokemon] = [
      Pokemon(n: "Pikachu", t: "Electric", w: "Ground"),
      Pokemon(n: "Squirtle", t: "Water", w: "Grass"),
      Pokemon(n: "Pichu", t: "Electric", w: "Ground"),
      Pokemon(n: "Charmander", t: "Fire", w: "Water")
      ]
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
