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
        pokemons = createArray()
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        btn.addShadow(shadowColor: UIColor(named: "ColorYellowShadow")!, shadowRadius: 10.0)
        
    }

    func createArray() -> [Pokemon] {
        var tempPokemon: [Pokemon] = []
        
        tempPokemon.append(Pokemon(num: "001", name: "Bulbasaur", type: "Grass", image: Images.bulbasaur))
        tempPokemon.append(Pokemon(num: "002", name: "Ivysaur", type: "Grass", image: Images.ivysaur))
        tempPokemon.append(Pokemon(num: "003", name: "Venusaur", type: "Grass", image: Images.venusaur))
        tempPokemon.append(Pokemon(num: "004", name: "Charmander", type: "Fire", image: Images.charmander))
        tempPokemon.append(Pokemon(num: "005", name: "Charmeleon", type: "Fire", image: Images.charmeleon))
        tempPokemon.append(Pokemon(num: "006", name: "Charizard", type: "Fire", image: Images.charizard))
        tempPokemon.append(Pokemon(num: "007", name: "Squirtle", type: "Water", image: Images.squirtle))
        tempPokemon.append(Pokemon(num: "008", name: "Wartortle", type: "Water", image: Images.wartortle))
        tempPokemon.append(Pokemon(num: "009", name: "Blastoise", type: "Water", image: Images.blastoise))
        tempPokemon.append(Pokemon(num: "010", name: "Caterpie", type: "Bug", image: Images.caterpie))
        tempPokemon.append(Pokemon(num: "011", name: "Metapod", type: "Bug", image: Images.metapod))
        
        return tempPokemon
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
