//
//  WelcomeView.swift
//  RickAndMorty
//
//  Created by Salman Z on 1/30/25.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to Rick and Morty View")
                .font(.title)
                .foregroundStyle(.white)
            
            Text("Explore the cosmos with Rick and Morty")
                .foregroundColor(.portalAccent)
            
            Image(.welcome)
                .resizable()
                .scaledToFit()
            
            NavigationLink(destination: CharacterListView(viewModel: viewModel)) {
                Text("Open Portal")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.portalAccent)
                    .cornerRadius(10)
                    .bold()
                    .shadow(radius: 5)
            }
            Spacer()

        }
        .background(Color.cosmicBackground)
        .ignoresSafeArea()
    }
}

//#Preview {
//    WelcomeView(characters: characters.constant)
//}

extension Color {
    static let cosmicBackground = Color(red: 0.1, green: 0.1, blue: 0.2) // Deep space blue
    static let portalAccent = Color(red: 0.38, green: 1.0, blue: 0.0)  // Rick's portal green
    static let purplePortal = Color(red: 0.58, green: 0.0, blue: 1.0)   // Purple portal color
}
