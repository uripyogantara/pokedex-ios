//
//  DetailViewController.swift
//  Pokedex
//
//  Created by LPT 528 on 2/4/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var whiteBackgroundView: UIView!
    @IBOutlet var btnStats: UIButton!
    @IBOutlet var viewPokemonType: UIView!
    
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var atkLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    @IBOutlet weak var satkLabel: UILabel!
    @IBOutlet weak var sdefLabel: UILabel!
    @IBOutlet weak var spdLabel: UILabel!
    
    @IBOutlet var progressViewHP: UIProgressView!
    @IBOutlet weak var atkProgressView: UIProgressView!
    @IBOutlet weak var defProgressView: UIProgressView!
    @IBOutlet weak var satkProgressView: UIProgressView!
    @IBOutlet weak var sdefProgressView: UIProgressView!
    
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var iconPokemonType: UIImageView!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var btnEvolutions: UIButton!
    @IBOutlet weak var btnMoves: UIButton!
    @IBOutlet weak var spdProgressView: UIProgressView!
    
    @IBOutlet weak var typesStackView: UIStackView!
    
    
    var pokemonColor: UIColor!
    var pokemonColorSecondary: UIColor!
    
    private var pokemon:Pokemon!
    
    func setPokemon(pokemon: Pokemon){
        self.pokemon = pokemon
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonColor = getColorByType(type: pokemon.type[0])
        pokemonColorSecondary = getColorSecondaryByType(type: pokemon.type[0])
        
        view.setGradientBackground(colorOne: pokemonColor, colorTwo: pokemonColorSecondary)
        pokemonNameLabel.text = pokemon.name
        
        whiteBackgroundView.layer.cornerRadius = 30

        btnStats.backgroundColor = pokemonColor
        btnStats.addShadow(shadowColor: pokemonColor, shadowRadius: 5.0)
        btnEvolutions.setTitleColor(pokemonColor, for: .normal)
        btnMoves.setTitleColor(pokemonColor, for: .normal)

        viewPokemonType.addShadow(shadowColor: pokemonColor, shadowRadius: 5.0)
        viewPokemonType.backgroundColor = pokemonColor
        
        pokemonTypeLabel.text = pokemon.type[0].uppercased()
        iconPokemonType.image = getIconByType(type: pokemon.type[0])
        
        hpLabel.textColor = pokemonColor
        atkLabel.textColor = pokemonColor
        defLabel.textColor = pokemonColor
        satkLabel.textColor = pokemonColor
        sdefLabel.textColor = pokemonColor
        spdLabel.textColor = pokemonColor
        
        setPokemonType(types: pokemon.type)
        
        let stringUrl = pokemon.img.replacingOccurrences(of: "http", with: "https")
        
        let url = URL(string: stringUrl)
        downloadImage(from: url!)
        
        progressViewHP.setColorAndScale(color: pokemonColorSecondary)
        atkProgressView.setColorAndScale(color: pokemonColorSecondary)
        defProgressView.setColorAndScale(color: pokemonColorSecondary)
        satkProgressView.setColorAndScale(color: pokemonColorSecondary)
        sdefProgressView.setColorAndScale(color: pokemonColorSecondary)
        spdProgressView.setColorAndScale(color: pokemonColorSecondary)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
                self.pokemonImage.image = UIImage(data: data)
            }
        }
    }
    
    func setPokemonType(types: [String]){
        for view in typesStackView.subviews {
            view.removeFromSuperview()
        }
        
        for type in types{
            let pokemonColor = getColorByType(type: type)
            let viewType = UIView()
            let iconPokemon = getIconByType(type: type)
            let imageView = UIImageView(image: iconPokemon)
            let typeLabel = UILabel()
            
            viewType.backgroundColor = pokemonColor
            viewType.frame.size.height = 30
            viewType.frame.size.width = 110
            viewType.addShadow(shadowColor: pokemonColor, shadowRadius: 5.0)
            
            typeLabel.textColor = .white
            typeLabel.text = type.uppercased()
            typeLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
            
            viewType.addSubview(imageView)
            viewType.addSubview(typeLabel)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
            
            imageView.centerYAnchor.constraint(equalTo: viewType.centerYAnchor).isActive = true
            imageView.leadingAnchor.constraint(equalTo: viewType.leadingAnchor, constant: 20).isActive = true
            
            typeLabel.translatesAutoresizingMaskIntoConstraints = false
            typeLabel.centerYAnchor.constraint(equalTo: viewType.centerYAnchor).isActive = true
            typeLabel.centerXAnchor.constraint(equalTo: viewType.centerXAnchor, constant: 10).isActive = true
            
            typesStackView.addArrangedSubview(viewType)
            
            viewType.translatesAutoresizingMaskIntoConstraints = false
            viewType.heightAnchor.constraint(equalToConstant: 30).isActive = true
            viewType.widthAnchor.constraint(equalToConstant: 110).isActive = true
        }
    }

}
