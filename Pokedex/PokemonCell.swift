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
        
        pokemonNameLabel.text = pokemon.name
        pokemonIdLabel.text = "#"+pokemon.num
        
        let stringUrl = pokemon.img.replacingOccurrences(of: "http", with: "https")
        
        let url = URL(string: stringUrl)
        downloadImage(from: url!)
//        pokemonTypeView.backgroundColor = getColorByType(type: pokemon.type)
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
