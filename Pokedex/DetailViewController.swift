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
    @IBOutlet var progressViewHP: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground(colorOne: UIColor(named: "ColorYellow")!, colorTwo: UIColor(named: "ColorYellowSecondary")!)
        
        whiteBackgroundView.layer.cornerRadius = 30
        
        btnStats.addShadow(shadowColor: UIColor(named: "ColorYellow")!, shadowRadius: 5.0)
        
        viewPokemonType.addShadow(shadowColor: UIColor(named: "ColorYellow")!, shadowRadius: 5.0)
        
        progressViewHP.transform = CGAffineTransform(scaleX: 1, y: 4)
        
        progressViewHP.layer.cornerRadius = 8.0
        progressViewHP.clipsToBounds = true
        progressViewHP.layer.sublayers![1].cornerRadius = 8.0
        progressViewHP.subviews[1].clipsToBounds = true
        
        
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

}
