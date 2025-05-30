//
//  ContentView.swift
//  lexigo-ios
//
//  Created by Zain Karim on 5/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            DictionaryView()
                .tabItem {
                    Label("Dictionary", systemImage: "book")
                }
            FlashcardsView()
                .tabItem {
                    Label("Flashcards", systemImage: "rectangle.on.rectangle")
                }
            QuizView()
                .tabItem{
                    Label("Quizzes", systemImage: "questionmark.circle")
                }
            FavoritesView()
                .tabItem{
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

#Preview {
    ContentView()
}

