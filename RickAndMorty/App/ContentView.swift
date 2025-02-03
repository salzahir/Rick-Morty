//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Salman Z on 1/30/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()

    var body: some View {
        NavigationStack{
            WelcomeView(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView()
}
