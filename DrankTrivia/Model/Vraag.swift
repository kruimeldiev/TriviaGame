//
//  Vraag.swift
//  DrankTrivia
//
//  Created by Casper Daris on 24/04/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

struct Vraag: Hashable, Codable {
    
    let gesteldeVraag: String
    let antwoordA: String
    let antwoordB: String
    let antwoordC: String
    let antwoordD: String
    let juisteAntwoord: Int
    
    init(vraag: String, A: String, B: String, C: String, D: String, goedAntwoord: Int){
        gesteldeVraag = vraag
        antwoordA = A
        antwoordB = B
        antwoordC = C
        antwoordD = D
        juisteAntwoord = goedAntwoord
    }
    
}
