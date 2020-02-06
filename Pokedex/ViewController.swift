//
//  ViewController.swift
//  Pokedex
//
//  Created by LPT 528 on 1/30/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet var btn: UIButton!
    
    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchApi()
    }
    
    func fetchApi(){
        let baseUrl = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"
        print(baseUrl)
        guard let url = URL(string: baseUrl) else { return  }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data else { return }
            do {
                let pokemonsResult: PokemonData = try JSONDecoder().decode(PokemonData.self, from: data)
                print(pokemonsResult)
                self.pokemons = pokemonsResult.pokemon
                DispatchQueue.main.async {
                   self.pokemonTableView.delegate = self
                   self.pokemonTableView.dataSource = self
                }
            } catch let error {
                print("Error fetch data: ", error)
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = pokemons[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as! PokemonCell
        cell.setPokemon(pokemon: pokemon)
        
        return cell
    }
    
    
}
