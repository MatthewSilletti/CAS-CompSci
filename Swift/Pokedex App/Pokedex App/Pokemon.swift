//
//  Pokemon.swift
//  Pokedex App
//
//  Created by Matthew Silletti on 1/23/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import Foundation

class Pokemon{
    var name:String
    var type:String
    var weakness:String
    init(n:String, t:String, w:String) {
        name = n
        type = t
        weakness = w
    }
}
