//
//  VraagView.swift
//  DrankTrivia
//
//  Created by Casper Daris on 24/04/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct VraagView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var antwoordGegeven = false
    @State private var foutAntwoordGegeven = false
    @State private var spelerIsKiezer = false
    
    @State private var achtergrondKleur = "Light Cyan"
    
    var body: some View {
        
        ZStack {
            
            Color(achtergrondKleur)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("\(self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].naam):")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Electric Blue"))
                    .multilineTextAlignment(.center)
                    .padding(40)
                    .padding(.top, 40)
                
                Spacer()
                
                Text(viewModel.uitgekozenVraag.gesteldeVraag)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Electric Blue"))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                //OPTIE A
                Button(action: {
                    if self.viewModel.uitgekozenVraag.juisteAntwoord == 1 {
                        self.goedAntwoord()
                    } else if self.viewModel.uitgekozenVraag.juisteAntwoord != 1 {
                        self.foutAntwoord()
                    }
                }) {Text(viewModel.uitgekozenVraag.antwoordA)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .buttonStyle(SimpleButtonStyle(knopKleur: (self.foutAntwoordGegeven && self.viewModel.uitgekozenVraag.juisteAntwoord == 1) ? Color("Emerald") : Color(achtergrondKleur)))
                
                //OPTIE B
                Button(action: {
                    if self.viewModel.uitgekozenVraag.juisteAntwoord == 2 {
                        self.goedAntwoord()
                    } else if self.viewModel.uitgekozenVraag.juisteAntwoord != 2 {
                        self.foutAntwoord()
                    }
                }) {Text(viewModel.uitgekozenVraag.antwoordB)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .buttonStyle(SimpleButtonStyle(knopKleur: (self.foutAntwoordGegeven && self.viewModel.uitgekozenVraag.juisteAntwoord == 2) ? Color("Emerald") : Color(achtergrondKleur)))
                
                //OPTIE C
                Button(action: {
                    if self.viewModel.uitgekozenVraag.juisteAntwoord == 3 {
                        self.goedAntwoord()
                    } else if self.viewModel.uitgekozenVraag.juisteAntwoord != 3 {
                        self.foutAntwoord()
                    }
                }) {Text(viewModel.uitgekozenVraag.antwoordC)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .buttonStyle(SimpleButtonStyle(knopKleur: (self.foutAntwoordGegeven && self.viewModel.uitgekozenVraag.juisteAntwoord == 3) ? Color("Emerald") : Color(achtergrondKleur)))
                
                //OPTIE D
                Button(action: {
                    if self.viewModel.uitgekozenVraag.juisteAntwoord == 4 {
                        self.goedAntwoord()
                    } else if self.viewModel.uitgekozenVraag.juisteAntwoord != 4 {
                        self.foutAntwoord()
                    }
                }) {Text(viewModel.uitgekozenVraag.antwoordD)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .padding(.bottom)
                .buttonStyle(SimpleButtonStyle(knopKleur: (self.foutAntwoordGegeven && self.viewModel.uitgekozenVraag.juisteAntwoord == 4) ? Color("Emerald") : Color(achtergrondKleur)))
            }
            .alert(isPresented: $antwoordGegeven) {
                if self.foutAntwoordGegeven == true && self.spelerIsKiezer == false {
                    return Alert(title: Text("Fout antwoord!"),
                                 message: Text("\(self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].naam), neem een slok."),
                                 dismissButton: .default(Text("Doorgaan"),
                                                         action: {
                                                            self.doorgaan()
                                                            self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].aantalFout += 1
                                 }))
                } else if self.foutAntwoordGegeven == false && self.spelerIsKiezer == false {
                    return Alert(title: Text("Goed antwoord!"),
                                 message: Text("\(self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].naam), je mag \(Int.random(in: 2..<4)) slokken uitdelen."),
                                 dismissButton: .default(Text("Doorgaan"),
                                                         action: {
                                                            self.doorgaan()
                                                            self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].aantalGoed += 1
                                 }))
                } else if self.foutAntwoordGegeven == true && self.spelerIsKiezer == true {
                    return Alert(title: Text("Fout antwoord!"),
                                 message: Text("\(self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].naam), je hebt jezelf flink overschat. Neem \(Int.random(in: 2..<6)) slokken."),
                                 dismissButton: .default(Text("Doorgaan"),
                                                         action: {
                                                            self.doorgaan()
                                                            self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].aantalFout += 1
                                 }))
                } else if self.foutAntwoordGegeven == false && self.spelerIsKiezer == true {
                    return Alert(title: Text("Goed antwoord!"),
                                 message: Text("\(self.viewModel.spelerLijst[self.viewModel.huidigeSpeler].naam), je zelfvertrouwen wordt beloond, deel \(Int.random(in: 1...(self.viewModel.spelerLijst.count))) slokken uit."),
                                 dismissButton: .default(Text("Doorgaan"),
                                                         action: {
                                                            self.doorgaan()
                                                            self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].aantalGoed += 1
                                 }))
                } else {
                    return Alert(title: Text("Er is een fout opgetreden."), dismissButton: .default(Text("Doorgaan"), action: {self.doorgaan()}))
                }
            }
        }
    }
    
    func goedAntwoord() {
        
        if self.viewModel.huidigeSpeler != self.viewModel.gekozenSpeler {
            self.viewModel.spelerLijst[self.viewModel.huidigeSpeler].levens -= 1
            self.antwoordGegeven.toggle()
        } else {
            self.spelerIsKiezer = true
            self.antwoordGegeven.toggle()
        }
        
        achtergrondKleur = "Emerald"
        
    }
    
    func foutAntwoord() {
        
        if self.viewModel.huidigeSpeler != self.viewModel.gekozenSpeler {
            self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].levens -= 1
            self.foutAntwoordGegeven = true
            self.antwoordGegeven.toggle()
        } else {
            self.foutAntwoordGegeven = true
            self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].levens -= 1
            self.spelerIsKiezer = true
            self.antwoordGegeven.toggle()
        }
        
        achtergrondKleur = "Fire Opal"
        
    }
    
    func doorgaan() {
        if self.viewModel.spelerLijst[self.viewModel.gekozenSpeler].levens <= 0 {
            self.viewModel.verlorenSpeler = self.viewModel.gekozenSpeler
            self.viewModel.huidigeView = "eindView"
            
        } else if self.viewModel.spelerLijst[self.viewModel.huidigeSpeler].levens <= 0 {
            self.viewModel.verlorenSpeler = self.viewModel.huidigeSpeler
            self.viewModel.huidigeView = "eindView"
            
        } else {
            self.viewModel.huidigeView = "tussenstandView"
            self.viewModel.categorieOptiesLaden()
            if self.viewModel.huidigeSpeler == self.viewModel.gekozenSpeler {
                
                if (self.viewModel.spelerLijst.count - 1) <= self.viewModel.huidigeSpeler {
                    self.viewModel.huidigeSpeler = 0
                } else {
                    self.viewModel.huidigeSpeler += 1
                }
                
            } else {
                self.viewModel.huidigeSpeler = self.viewModel.gekozenSpeler
            }
        }
    }
}

struct VraagView_Previews: PreviewProvider {
    static var previews: some View {
        VraagView(viewModel: ViewModel())
    }
}
