//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Salman Z on 1/30/25.
//

import SwiftUI

struct ContentView: View {
    @State var characters: [Character]  = []

    var body: some View {
        NavigationStack{
            WelcomeView(characters: $characters)
        }
    }
}

#Preview {
    ContentView()
}
