//
//  ViewModel.swift
//  DrankTrivia
//
//  Created by Casper Daris on 24/04/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var huidigeView: String = "titelView"

    @Published var spelerLijst = [Speler]()
    @Published var huidigeSpeler = 0
    @Published var gekozenSpeler = 0
    @Published var verlorenSpeler = 0
    
    @Published var categorieOpties = [0, 1, 2, 3]
    @Published var categorieLijst = ["Sport", "Muziek", "Film en TV", "Filosofie", "Drank", "Random shit", "Kunst en literatuur", "Geschiedenis", "Topografie"]
    @Published var gekozenCategorie: String = ""
    
    @Published var uitgekozenVraag: Vraag = Vraag(vraag: "Dit is een testvraag", A: "Dat was niet eens een vraag", B: "Als je dit kunt lezen, dan heb je de app gesloopt", C: "Hoe heb je dat voor elkaar gekregen?", D: "Waarom heb je dat gedaan?", goedAntwoord: 3)
    
    init(){
        
    }
    
    func spelerToevoegen(spelerNaam: String) {
        self.spelerLijst.append(Speler(naam: spelerNaam, levens: 5, aantalGoed: 0, aantalFout: 0))
    }
    
    func spelerVerwijderen(at index: Int) {
        self.spelerLijst.remove(at: index)
    }
    
    func spelerAanwijzen(gekozenSpeler: Int) {
        self.gekozenSpeler = gekozenSpeler
    }
    
    func categorieKiezen(categorie: String) {
        self.gekozenCategorie = categorie
    }
    
    func categorieOptiesLaden() {
        categorieOpties.removeAll()
        while categorieOpties.count < 4 {
            let nummer = Int.random(in: 0..<9)
            if !categorieOpties.contains(nummer){
                categorieOpties.append(nummer)
            }
        }
    }
    
    func juisteAntwoordTonen(juisteAntwoord: Int) -> String {
        if (juisteAntwoord == 1) {
            return self.uitgekozenVraag.antwoordA
        } else if (juisteAntwoord == 2) {
            return self.uitgekozenVraag.antwoordB
        } else if (juisteAntwoord == 3) {
            return self.uitgekozenVraag.antwoordC
        } else if (juisteAntwoord == 4) {
            return self.uitgekozenVraag.antwoordD
        } else {
            return "Juist antwoord onbekend"
        }
    }
    
    func vraagKiezen() {
        if gekozenCategorie == "Sport" {
            self.uitgekozenVraag = SportVragen.init().sportVragenLijst[Int.random(in: 0..<SportVragen.init().sportVragenLijst.count)]
        } else if gekozenCategorie == "Muziek" {
            self.uitgekozenVraag = MuziekVragen.init().muziekVragenLijst[Int.random(in: 0..<MuziekVragen.init().muziekVragenLijst.count)]
        } else if gekozenCategorie == "Film en TV" {
            self.uitgekozenVraag = FilmVragen.init().filmVragenLijst[Int.random(in: 0..<FilmVragen.init().filmVragenLijst.count)]
        } else if gekozenCategorie == "Filosofie" {
            self.uitgekozenVraag = FilosofieVragen.init().filosofieVragenLijst[Int.random(in: 0..<FilosofieVragen.init().filosofieVragenLijst.count)]
        } else if gekozenCategorie == "Drank" {
            self.uitgekozenVraag = DrankVragen.init().drankVragenLijst[Int.random(in: 0..<DrankVragen.init().drankVragenLijst.count)]
        } else if gekozenCategorie == "Random shit" {
            self.uitgekozenVraag = RandomShitVragen.init().randomShitVragenLijst[Int.random(in: 0..<RandomShitVragen.init().randomShitVragenLijst.count)]
        } else if gekozenCategorie == "Kunst en literatuur" {
            self.uitgekozenVraag = LiteratuurVragen.init().literatuurVragenLijst[Int.random(in: 0..<LiteratuurVragen.init().literatuurVragenLijst.count)]
        } else if gekozenCategorie == "Geschiedenis" {
            self.uitgekozenVraag = GeschiedenisVragen.init().geschiedenisVragenLijst[Int.random(in: 0..<GeschiedenisVragen.init().geschiedenisVragenLijst.count)]
        } else if gekozenCategorie == "Topografie" {
            self.uitgekozenVraag = TopografieVragen.init().topografieVragenLijst[Int.random(in: 0..<TopografieVragen.init().topografieVragenLijst.count)]
        }
    }
    
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct SimpleButtonStyle: ButtonStyle {
    
    var knopKleur: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .contentShape(Rectangle())
            .cornerRadius(10)
            .foregroundColor(Color("Electric Blue"))
            .background(
                Group {
                    if configuration.isPressed {
                        Rectangle()
                            .fill(knopKleur)
                            .cornerRadius(10)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray, lineWidth: 2)
                                    .blur(radius: 4)
                                    .mask(Rectangle()
                                        .fill(LinearGradient(Color.black, Color.clear)))
                                        .cornerRadius(10)
                            )
                            .overlay(
                                Rectangle()
                                    .stroke(Color.white, lineWidth: 2)
                                    .blur(radius: 8)
                                    .mask(Rectangle()
                                        .fill(LinearGradient(Color.clear, Color.black)))
                                        .cornerRadius(10)
                            )
                    } else {
                        Rectangle()
                            .fill(knopKleur)
                            .cornerRadius(10)
                            .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 3, y: 3)
                            .shadow(color: Color(.white).opacity(0.6), radius: 3, x: -3, y: -3)
                    }
                }
            )
    }
}
