//
//  Helper.swift
//  Pokedex
//
//  Created by LPT 528 on 2/10/20.
//

import Foundation
import UIKit

func getIconByType(type: String) -> UIImage {
    let type = type.lowercased()
    
    switch type {
        case "grass":
            return Icon.grass
        case "fire":
            return Icon.fire
        case "water":
            return Icon.water
        case "bug":
            return Icon.bug
        case "normal":
            return Icon.normal
        case "dark":
            return Icon.dark
        case "dragon":
            return Icon.dragon
        case "electric":
            return Icon.electric
        case "fairy":
            return Icon.fairy
        case "fighting":
            return Icon.fight
        case "flying":
            return Icon.fly
        case "ghost":
            return Icon.ghost
        case "ice":
            return Icon.ice
        case "poison":
            return Icon.poison
        case "psychic":
            return Icon.psychic
        case "rock":
            return Icon.rock
        case "steal":
            return Icon.steel

        default:
            return Icon.grass
    }
}

func getColorByType(type: String) -> UIColor {
    let type = type.lowercased()
    
    switch type {
        case "grass":
            return Color.grass
        case "fire":
            return Color.fire
        case "water":
            return Color.water
        case "bug":
            return Color.bug
        case "normal":
            return Color.normal
        case "dark":
            return Color.dark
        case "dragon":
            return Color.dragon
        case "electric":
            return Color.electric
        case "fairy":
            return Color.fairy
        case "fighting":
            return Color.fight
        case "flying":
            return Color.fly
        case "ghost":
            return Color.ghost
        case "ground":
            return Color.ground
        case "ice":
            return Color.ice
        case "poison":
            return Color.poison
        case "psychic":
            return Color.psychic
        case "rock":
            return Color.rock
        case "steal":
            return Color.steel

        default:
            return Color.grass
    }
}
