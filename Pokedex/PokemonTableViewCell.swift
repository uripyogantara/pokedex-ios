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

    @IBOutlet weak var typeStackView: UIStackView!
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
        
        setPokemonType(types: pokemon.type)
        
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
    
    func setPokemonType(types: [String]){
        for view in typeStackView.subviews {
            view.removeFromSuperview()
        }
        
        for type in types{
            let pokemonColor = getColorByType(type: type)
            let viewType = UIView()
            let iconPokemon = getIconByType(type: type)
            let imageView = UIImageView(image: iconPokemon)
            viewType.backgroundColor = pokemonColor
            viewType.frame.size.height = 40
            viewType.frame.size.width = 40
            viewType.addShadow(shadowColor: pokemonColor, shadowRadius: 5.0)
            
            viewType.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            imageView.centerYAnchor.constraint(equalTo: viewType.centerYAnchor).isActive = true
            imageView.centerXAnchor.constraint(equalTo: viewType.centerXAnchor).isActive = true
            
            typeStackView.addArrangedSubview(viewType)
            
            viewType.translatesAutoresizingMaskIntoConstraints = false
            viewType.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            viewType.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        }
    }
}
