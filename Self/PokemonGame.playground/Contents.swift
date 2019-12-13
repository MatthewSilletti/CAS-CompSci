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
    //    let Bulbasaur: [String: Any] = dictionary["Bulbasaur"] as! [String: Any]
    //    let name: String = Bulbasaur["name"] as! String
    //    let stats: [String: Any] = Bulbasaur["stats"] as! [String: Any]
    //    let health: Int = stats["health"] as! Int


func calculateDamage() {
    var damageDone = 0
    var healthTaken = 0
    var newHealth = 0
    
    if p1Type == p2Weakness {
        damageDone = (10 * (p1Attack/p1Defense) + 7) * 5
        healthTaken = damageDone
        newHealth = p2Health - healthTaken
        let p2OGHealth = p2Health
        print("You attacked with \(p1Name) and dealt \(damageDone) damage to \(p2Name). The attack was super effective as \(p2Name) has a weakness to \(p1Name)'s type: \(p1Type). \(p2Name) has \(newHealth) health points out of \(p2OGHealth) remaining.")
    } else if  p1Type == p2Type {
        damageDone = (10 * (p1Attack/p1Defense) + 7) * 2
        healthTaken = damageDone
        newHealth = p2Health - healthTaken
        let p2OGHealth = p2Health
        print("You attacked with \(p1Name) and dealt \(damageDone) damage to \(p2Name). The attack was not very effective as \(p2Name) is the same type as \(p1Name). \(p2Name) has \(newHealth) health points out of \(p2OGHealth) remaining.")
    } else if p1Weakness == p2Type {
        damageDone = (10 * (p1Attack/p1Defense) + 7)
        healthTaken = damageDone
        newHealth = p2Health - healthTaken
        let p2OGHealth = p2Health
        print("You attacked with \(p1Name) and dealt \(damageDone) damage to \(p2Name). The attack was extremely ineffective as \(p2Name) is strong against \(p1Name)'s type: \(p1Type). \(p2Name) has \(newHealth) health points out of \(p2OGHealth) remaining.")
    } else {
        print("no worko")
    }
    //how do i get it to attack which pokemon, as in how should i set this function up before putting in the logic?
}
calculateDamage()




