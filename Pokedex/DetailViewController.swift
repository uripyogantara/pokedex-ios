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
        
//        view.backgroundColor = pokemonColor
        view.setGradientBackground(colorOne: pokemonColor, colorTwo: pokemonColorSecondary)
        pokemonNameLabel.text = pokemon.name
//
        whiteBackgroundView.layer.cornerRadius = 30
//
        btnStats.backgroundColor = pokemonColor
        btnStats.addShadow(shadowColor: pokemonColor, shadowRadius: 5.0)
        btnEvolutions.setTitleColor(pokemonColor, for: .normal)
        btnMoves.setTitleColor(pokemonColor, for: .normal)
//
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
        
        let stringUrl = pokemon.img.replacingOccurrences(of: "http", with: "https")
        
        let url = URL(string: stringUrl)
        downloadImage(from: url!)
        
        progressViewHP.setColorAndScale(color: pokemonColor)
        atkProgressView.setColorAndScale(color: pokemonColor)
        defProgressView.setColorAndScale(color: pokemonColor)
        satkProgressView.setColorAndScale(color: pokemonColor)
        sdefProgressView.setColorAndScale(color: pokemonColor)
        spdProgressView.setColorAndScale(color: pokemonColor)
        
//
//        progressViewHP.transform = CGAffineTransform(scaleX: 1, y: 4)
//
//        progressViewHP.layer.cornerRadius = 8.0
//        progressViewHP.clipsToBounds = true
//        progressViewHP.layer.sublayers![1].cornerRadius = 8.0
//        progressViewHP.subviews[1].clipsToBounds = true
        
        
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

}
