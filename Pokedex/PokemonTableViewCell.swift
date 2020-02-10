//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by LPT 528 on 2/9/20.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIdLabel: UILabel!
    @IBOutlet weak var pokemonTypeView: UIView!
    @IBOutlet weak var iconPokemonType: UIImageView!

//    @IBOutlet weak var pokemonNumLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
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
}
