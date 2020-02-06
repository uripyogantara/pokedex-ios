//
//  PokemonCell.swift
//  Pokedex
//
//  Created by LPT 528 on 2/6/20.
//

import UIKit

class PokemonCell: UITableViewCell {

    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIdLabel: UILabel!
    @IBOutlet weak var pokemonTypeView: UIView!
    
    func setPokemon(pokemon: Pokemon){
        imagePokemon.image = pokemon.image
        pokemonNameLabel.text = pokemon.name
        pokemonIdLabel.text = pokemon.num
//        pokemonTypeView.backgroundColor = getColorByType(type: pokemon.type)
    }
    
    func getColorByType(type: String) -> UIColor {
        if(type == "Grass"){
            return Color.grass
        } else if (type == "Fire"){
            return Color.fire
        } else if (type == "Water"){
            return Color.water
        } else if (type == "Bug"){
            return Color.bug
        }
        return Color.grass
        
    }
}
