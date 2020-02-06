//
//  Pokemon.swift
//  Pokedex
//
//  Created by LPT 528 on 2/6/20.
//

import Foundation
import UIKit
class Pokemon {
    var image: UIImage
    var name: String
    var num: String
    var type: String
    
    init(num: String, name: String, type: String, image: UIImage) {
        self.num = num
        self.name = name
        self.type = type
        self.image = image
    }
}
