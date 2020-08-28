//
//  TitelView.swift
//  DrankTrivia
//
//  Created by Casper Daris on 24/04/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct TitelView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State var nieuweSpelerNaam: String = ""
    @State private var toonSpelerNaamAlert = false
    @State private var toonTeWeinigSpelersAlert = false
    @State private var toonUitlegSheet = false
    
    @State var value: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            
            Color("Light Cyan")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image("BeetjeDomLogo v2")
                    .resizable()
                    .frame(width: 125, height: 130)
                    .padding()
                
                Text("Beetje Dom")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("Electric Blue"))
                
                ScrollView {
                    ForEach(0..<self.viewModel.spelerLijst.count, id: \.self) { speler in
                        HStack {
                            Text(self.viewModel.spelerLijst[speler].naam)
                                .fontWeight(.semibold)
                            Spacer()
                            Button(action: {
                                self.viewModel.spelerVerwijderen(at: speler)
                            }) {Image(systemName: "trash.fill").foregroundColor(Color("Fire Opal"))}
                        }
                        .padding()
                        .background(Color("Light Cyan"))
                        .foregroundColor(Color("Electric Blue"))
                        .cornerRadius(10)
                        .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 3, y: 3)
                        .shadow(color: Color(.white).opacity(0.6), radius: 3, x: -3, y: -3)
                        .padding(5)
                    }
                    .padding()
                    .frame(width: 280)
                }.frame(maxHeight: 320)
                
                HStack {
                    
                    Button(action: {
                        self.toonUitlegSheet.toggle()
                    }) {Image(systemName: "info.circle.fill")
                        .font(.title)
                        .frame(width: 30, height: 20)
                    }
                    .buttonStyle(SimpleButtonStyle(knopKleur: Color("Light Cyan")))
                    .sheet(isPresented: $toonUitlegSheet, content: {UitlegSheet()})
                    
                    TextField("Nieuwe Speler", text: $nieuweSpelerNaam)
                        .padding()
                        .frame(width: 180.0)
                        .background(Color("Light Cyan"))
                        .foregroundColor(Color("Electric Blue"))
                        .cornerRadius(10)
                        .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 3, y: 3)
                        .shadow(color: Color(.white).opacity(0.6), radius: 3, x: -3, y: -3)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .padding()
                    
                    Button(action: {
                        if self.nieuweSpelerNaam.count >= 3 && self.nieuweSpelerNaam.count <= 12 {
                            self.viewModel.spelerToevoegen(spelerNaam: self.nieuweSpelerNaam)
                            self.nieuweSpelerNaam.removeAll()
                        }else{
                            self.toonSpelerNaamAlert.toggle()
                        }
                    }) {Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .frame(width: 30, height: 20)
                    }
                    .alert(isPresented: $toonSpelerNaamAlert) {
                        Alert(title: Text("Toevoegen mislukt"), message: Text("Speler naam moet uit 3 tot 12 tekens bestaan."), dismissButton: .default(Text("Ok")))
                    }
                    .buttonStyle(SimpleButtonStyle(knopKleur: Color("Light Cyan")))
                    
                }
                
                Spacer()
                
                Button(action: {
                    if self.viewModel.spelerLijst.count >= 2 && self.viewModel.spelerLijst.count <= 32 {
                        self.viewModel.huidigeView = "tussenstandView"
                        self.viewModel.spelerLijst.shuffle()
                        self.viewModel.categorieOptiesLaden()
                    } else if self.viewModel.spelerLijst.count < 2 || self.viewModel.spelerLijst.count > 32 {
                        self.toonTeWeinigSpelersAlert.toggle()
                    }
                }) {Text("Start")
                    .padding(.horizontal, 100)
                }
                .alert(isPresented: $toonTeWeinigSpelersAlert) {
                    Alert(title: Text("Spel beginnen mislukt"), message: Text("Je hebt minimaal 2 tot maximaal 32 spelers nodig om het spel te starten."), dismissButton: .default(Text("Ok")))
                }
                .buttonStyle(SimpleButtonStyle(knopKleur: Color("Light Cyan")))
                
                Spacer()
                
            }
        }
        .offset(y: -(self.value / 2))
        .animation(.spring())
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) {
                (noti) in
                let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                self.value = height
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) {
                (noti) in
                self.value = 0
            }
        }
    }
}

struct TitelView_Previews: PreviewProvider {
    static var previews: some View {
        TitelView(viewModel: ViewModel())
    }
}
