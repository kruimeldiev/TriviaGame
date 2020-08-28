//
//  Speler.swift
//  DrankTrivia
//
//  Created by Casper Daris on 24/04/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

struct Speler: Identifiable, Hashable {
    
    let id = UUID()
    let naam: String
    var levens: Int
    var aantalGoed: Int
    var aantalFout: Int
    
    init(naam: String, levens: Int, aantalGoed: Int, aantalFout: Int){
        
        self.naam = naam
        self.levens = levens
        self.aantalGoed = aantalGoed
        self.aantalFout = aantalFout
        
    }
    
}
