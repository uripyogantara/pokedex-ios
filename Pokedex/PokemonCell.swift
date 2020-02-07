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
    @IBOutlet weak var iconPokemonType: UIImageView!
    
    func setPokemon(pokemon: Pokemon){
        
        pokemonNameLabel.text = pokemon.name
        pokemonIdLabel.text = "#"+pokemon.num
        
        setPokemonType(type: pokemon.type)
        
        let stringUrl = pokemon.img.replacingOccurrences(of: "http", with: "https")
        
        let url = URL(string: stringUrl)
        downloadImage(from: url!)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.imagePokemon.image = UIImage(data: data)
            }
        }
    }
    
    func setPokemonType(type: [String]){
        let pokemonColor = getColorByType(type: type[0])
        pokemonTypeView.backgroundColor = pokemonColor
        pokemonTypeView.addShadow(shadowColor: pokemonColor, shadowRadius: 5.0)
        iconPokemonType.image = getIconByType(type: type[0])
    }
    
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
}
