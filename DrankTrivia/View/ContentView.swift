//
//  ContentView.swift
//  DrankTrivia
//
//  Created by Casper Daris on 24/04/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.huidigeView == "titelView" {
                TitelView(viewModel: viewModel)
            } else if viewModel.huidigeView == "tussenstandView" {
                TussenstandView(viewModel: viewModel)
            } else if viewModel.huidigeView == "vraagView" {
                VraagView(viewModel: viewModel)
            } else if viewModel.huidigeView == "eindView" {
                EindView(viewModel : viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
