//
//  UitlegSheet.swift
//  DrankTrivia
//
//  Created by Casper Daris on 02/06/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct UitlegSheet: View {
    var body: some View {
        
        ZStack {
            
            Color("Light Cyan")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack() {
                    Image(systemName: "1.circle.fill")
                        .font(.title)
                    
                    Text("Iedere speler begint het spel met vijf levens.")
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                
                VStack {
                    Image(systemName: "2.circle.fill")
                        .font(.title)
                    
                    Text("De speler die aan de beurt is kiest een medespeler of zichzelf uit, plus een categorie om een vraag over te beantwoorden.")
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                
                VStack {
                    Image(systemName: "3.circle.fill")
                        .font(.title)
                    
                    Text("Wanneer de vraag onjuist beantwoord is, verliest degene die antwoord heeft gegeven, een leven en moet hij/zij drinken. Als je jezelf hebt uitgekozen om antwoord te geven, drink je extra.")
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                
                VStack {
                    Image(systemName: "4.circle.fill")
                        .font(.title)
                    
                    Text("Wanneer de vraag correct beantwoord is, mag degene die antwoord heeft gegeven een willekeurig aantal slokken uitdelen. Degene die deze speler heeft uitgekozen, verliest een leven. Als je jezelf hebt uitgekozen om antwoord te geven mag je extra uitdelen.")
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                
                VStack {
                    Image(systemName: "5.circle.fill")
                        .font(.title)
                    
                    Text("De speler die de vorige vraag beantwoord heeft, mag nu een nieuwe speler uitkiezen. Als je jezelf hebt uitgekozen, dan is de volgende in de lijst aan de beurt.")
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                
                VStack {
                    Image(systemName: "6.circle.fill")
                        .font(.title)
                    
                    Text("Zodra een speler geen levens meer over heeft, stopt het spel en moet de verliezer zijn/haar glas adten. De rest mag het aantal levens dat diegene nog over heeft, in slokken uitdelen.")
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                
            }
            .foregroundColor(Color("Electric Blue"))
        }
    }
}

struct UitlegSheet_Previews: PreviewProvider {
    static var previews: some View {
        UitlegSheet()
    }
}
