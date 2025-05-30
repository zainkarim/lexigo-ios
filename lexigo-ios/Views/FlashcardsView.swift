//
//  FlashcardsView.swift
//  lexigo-ios
//
//  Created by Zain Karim on 5/30/25.
//

import SwiftUI

struct FlashcardsView: View {
    
    var body: some View {
        VStack{
            card
        }
        .padding()
    }
    
    var card: some View {
        CardView(word: "Juxtaposition", definition: "This is a definition")
    }
}

struct CardView: View {
    let word: String
    let definition: String
    
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            Rectangle()
            .fill(Color.white)
                .shadow(radius: 5)
                .frame(height: 250)
                .padding()
            if isFaceUp {
                faceUp
            } else {
                faceDown
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
    var faceUp: some View {
        VStack{
            Text(word)
                .font(.headline)
            Text(definition)
                .font(.subheadline)
        }
    }
    
    var faceDown: some View {
        VStack {
            Text(word)
                .font(.title)
        }
    }
}

#Preview {
    FlashcardsView()
}
