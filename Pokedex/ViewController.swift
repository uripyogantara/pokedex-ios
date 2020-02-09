//
//  ViewController.swift
//  Pokedex
//
//  Created by LPT 528 on 1/30/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pokemonTableView: UITableView!
    
    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PokemonTableViewCell", bundle: nil)
        pokemonTableView.register(nib, forCellReuseIdentifier: "PokemonTableViewCell")
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        fetchApi()
    }
    
//    automatic reference counting
    
    func fetchApi() {
        let baseUrl = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"
        print(baseUrl)
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, let self = self else { return }
            do {
                let pokemonsResult: PokemonData = try JSONDecoder().decode(PokemonData.self, from: data)
                print(pokemonsResult)
                self.pokemons = pokemonsResult.pokemon
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.pokemonTableView.reloadData()
                }
            } catch {
                print("Error fetch data: ", error)
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = pokemons[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell") as! PokemonTableViewCell
        cell.setPokemon(pokemon: pokemon)
        return cell
    }
}
