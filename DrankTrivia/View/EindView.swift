//
//  EindScherm.swift
//  DrankTrivia
//
//  Created by Casper Daris on 29/04/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct EindView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        ZStack{
            
            Color("Light Cyan")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Text("\(self.viewModel.spelerLijst[self.viewModel.verlorenSpeler].naam) heeft verloren")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Electric Blue"))
                    .multilineTextAlignment(.center)
                
                Text("\(self.viewModel.spelerLijst[self.viewModel.verlorenSpeler].naam), adt je glas leeg.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(40)
                    .foregroundColor(Color("Electric Blue"))
                
                ScrollView {
                    ForEach(0..<self.viewModel.spelerLijst.count, id: \.self) { speler in
                        VStack(alignment: .leading, spacing: 4.0) {
                            Text("\(self.viewModel.spelerLijst[speler].naam) mag \(self.viewModel.spelerLijst[speler].levens) slokken uitdelen.")
                                .font(.headline)
                            Text("Aantal vragen goed: \(self.viewModel.spelerLijst[speler].aantalGoed)")
                                .font(.footnote)
                            Text("Aantal vragen fout: \(self.viewModel.spelerLijst[speler].aantalFout)")
                                .font(.footnote)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("Light Cyan"))
                        .foregroundColor(Color("Electric Blue"))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
                        .shadow(color: Color.white.opacity(0.6), radius: 3, x: -3, y: -3)
                        .padding(10.0)
                    }
                    .padding()
                }
                .frame(height: 350.0)
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        for i in 0..<self.viewModel.spelerLijst.count {
                            self.viewModel.spelerLijst[i].levens = 5
                            self.viewModel.spelerLijst[i].aantalGoed = 0
                            self.viewModel.spelerLijst[i].aantalFout = 0
                        }
                        self.viewModel.huidigeView = "tussenstandView"
                    }) {Text("Herstarten").frame(width: 120, height: 25)}
                        .buttonStyle(SimpleButtonStyle(knopKleur: Color("Light Cyan")))
                    
                    Spacer()
                    
                    Button(action: {
                        for i in 0..<self.viewModel.spelerLijst.count {
                            self.viewModel.spelerLijst[i].levens = 5
                            self.viewModel.spelerLijst[i].aantalGoed = 0
                            self.viewModel.spelerLijst[i].aantalFout = 0
                        }
                        self.viewModel.huidigeView = "titelView"
                    }) {Text("Spel beëndigen").frame(width: 120, height: 25)}
                        .buttonStyle(SimpleButtonStyle(knopKleur: Color("Light Cyan")))
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct EindView_Previews: PreviewProvider {
    static var previews: some View {
        EindView(viewModel: ViewModel())
    }
}
