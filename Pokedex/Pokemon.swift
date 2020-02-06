//
//  Pokemon.swift
//  Pokedex
//
//  Created by LPT 528 on 2/6/20.
//

import Foundation
import UIKit

// MARK: - Pokemon Data
struct PokemonData: Decodable {
    let pokemon: [Pokemon]
}

// MARK: - Pokemon
struct Pokemon: Decodable {
    let id: Int
    let num, name: String
    let img: String
    let type: [String]
}

// MARK: - NextEvolution
struct NextEvolution: Decodable {
    let num, name: String
}
