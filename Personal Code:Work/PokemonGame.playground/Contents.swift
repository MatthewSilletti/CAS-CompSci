import UIKit

let fileUrl = Bundle.main.url(forResource: "pokemonList", withExtension: "json")

let pokemonFileData = try! Data(contentsOf: fileUrl!)

func getData() {
    let json = try? JSONSerialization.jsonObject(with: pokemonFileData, options: [])
    
    let dictionary = json as! [String: Any?]
    
    //    let Bulbasaur: [String: Any] = dictionary["Bulbasaur"] as! [String: Any]
    //    let name: String = Bulbasaur["name"] as! String
    //    let stats: [String: Any] = Bulbasaur["stats"] as! [String: Any]
    //    let health: Int = stats["health"] as! Int

}

func





