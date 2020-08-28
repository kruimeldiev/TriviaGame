//
//  TussenstandView.swift
//  DrankTrivia
//
//  Created by Casper Daris on 24/04/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct TussenstandView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var toonSpelStoppenAlert = false
    @State var spelerWijzerStandView = 0
    @State var spelerAangewezenStandView = 0
    
    var body: some View {
        
        ZStack {
            
            Color("Light Cyan")
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                //Spel stoppen knop
                HStack {
                    Button(action: {
                        self.toonSpelStoppenAlert.toggle()
                    }) {Text("Spel stoppen")
                        .font(.footnote)
                        .foregroundColor(Color("Fire Opal"))
                    }
                    .buttonStyle(SimpleButtonStyle(knopKleur: Color("Light Cyan")))
                    .alert(isPresented: $toonSpelStoppenAlert) {
                        Alert(title: Text("Weet je het zeker?"), message: Text("Als je het spel stop zet, gaan alle gegevens van het huidige spel verloren."), primaryButton: .cancel(Text("Doorspelen")), secondaryButton: .default(Text("Spel stoppen"), action: {
                            self.viewModel.huidigeView = "titelView"
                            for i in 0..<self.viewModel.spelerLijst.count {
                                self.viewModel.spelerLijst[i].levens = 5
                            }
                        }))
                    }
                    .padding()
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                //Uitleg tekst
                Text("\(self.viewModel.spelerLijst[self.viewModel.huidigeSpeler].naam) kiest een speler en categorie uit")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(Color("Electric Blue"))
                
                //Picker om speler aan te wijzen
                Picker(selection: $spelerAangewezenStandView, label: Text("")) {
                    ForEach(0..<viewModel.spelerLijst.count) { speler in
                        HStack {
                            Text(self.viewModel.spelerLijst[speler].naam)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Electric Blue"))
                            Spacer()
                            ForEach(0..<self.viewModel.spelerLijst[speler].levens) {_ in
                                Image(systemName: "heart.fill").foregroundColor(Color("Fire Opal"))
                            }
                        }
                    }
                }
                .labelsHidden()
                .frame(height: 150)
                
                Spacer()
                
                Text("\(self.viewModel.spelerLijst[self.spelerAangewezenStandView].naam) beantwoord een vraag over:")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .foregroundColor(Color("Electric Blue"))
                
                Spacer()
                
                //Lijst met opties voor categorieën (A en B)
                HStack {
                    
                    Spacer()
                    
                    //Optie A
                    Button(action: {
                        self.viewModel.spelerAanwijzen(gekozenSpeler: self.spelerAangewezenStandView)
                        self.viewModel.categorieKiezen(categorie: self.viewModel.categorieLijst[self.viewModel.categorieOpties[0]])
                        self.viewModel.vraagKiezen()
                        self.viewModel.huidigeView = "vraagView"
                    }) {Text(viewModel.categorieLijst[viewModel.categorieOpties[0]]).frame(width: 120, height: 60)}
                        .buttonStyle(SimpleButtonStyle(knopKleur: Color("Light Cyan")))
                    
                    Spacer()
                    
                    //Optie B
                    Button(action: {
                        self.viewModel.spelerAanwijzen(gekozenSpeler: self.spelerAangewezenStandView)
                        self.viewModel.categorieKiezen(categorie: self.viewModel.categorieLijst[self.viewModel.categorieOpties[1]])
                        self.viewModel.vraagKiezen()
                        self.viewModel.huidigeView = "vraagView"
                    }) {Text(viewModel.categorieLijst[viewModel.categorieOpties[1]]).frame(width: 120, height: 60)}
                        .buttonStyle(SimpleButtonStyle(knopKleur: Color("Light Cyan")))
                    
                    Spacer()
                }
                .padding()
                
                //Lijst met opties voor categorieën (C en D)
                HStack {
                    
                    Spacer()
                    
                    //Optie C
                    Button(action: {
                        self.viewModel.spelerAanwijzen(gekozenSpeler: self.spelerAangewezenStandView)
                        self.viewModel.categorieKiezen(categorie: self.viewModel.categorieLijst[self.viewModel.categorieOpties[2]])
                        self.viewModel.vraagKiezen()
                        self.viewModel.huidigeView = "vraagView"
                    }) {Text(viewModel.categorieLijst[viewModel.categorieOpties[2]]).frame(width: 120, height: 60)}
                        .buttonStyle(SimpleButtonStyle(knopKleur: Color("Light Cyan")))
                    
                    Spacer()
                    
                    //Optie D
                    Button(action: {
                        self.viewModel.spelerAanwijzen(gekozenSpeler: self.spelerAangewezenStandView)
                        self.viewModel.categorieKiezen(categorie: self.viewModel.categorieLijst[self.viewModel.categorieOpties[3]])
                        self.viewModel.vraagKiezen()
                        self.viewModel.huidigeView = "vraagView"
                    }) {Text(viewModel.categorieLijst[viewModel.categorieOpties[3]]).frame(width: 120, height: 60)}
                        .buttonStyle(SimpleButtonStyle(knopKleur: Color("Light Cyan")))
                    
                    Spacer()
                    
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct TussenstandView_Previews: PreviewProvider {
    static var previews: some View {
        TussenstandView(viewModel: ViewModel())
    }
}
