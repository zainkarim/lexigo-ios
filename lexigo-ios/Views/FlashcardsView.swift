//
//  FlashcardsView.swift
//  lexigo-ios
//
//  Created by Zain Karim on 5/30/25.
//

import SwiftUI

let flashcards = [
    Flashcard(word: "Juxtaposition", definition: "this is a definition"),
    Flashcard(word: "Ameliorate", definition: "this is a definition"),
    Flashcard(word: "Serendipitous", definition: "this is a definition"),
    Flashcard(word: "Obfuscate", definition: "this is a definition")
]

struct FlashcardsView: View {
    @State var cardNumber = 0
    var body: some View {
        VStack{
            card
            cardSelectorButtons
        }
        .padding()
    }
    
    var card: some View {
        CardView(flashcard: flashcards[cardNumber])
    }
    
    var cardSelectorButtons: some View {
        HStack{
            previousCard
            Spacer()
            nextCard
        }
    }
    
    func cardSelector(by offset: Int, label: String) -> some View{
        Button(action: {
            cardNumber += offset
        }, label: {
            Text(label)
        })
        .disabled(cardNumber + offset < 0 || cardNumber + offset >= flashcards.count)
    }
    
    var previousCard: some View {
        cardSelector(by: -1, label: "Previous")
    }
    
    var nextCard: some View {
        cardSelector(by: 1, label: "Next")
    }
}

struct CardView: View {
    let flashcard: Flashcard
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
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
            Text(flashcard.definition)
        }
    }
    
    var faceDown: some View {
        VStack {
            Text(flashcard.word)
                .font(.title)
        }
    }
}

struct Flashcard {
    let word: String
    let definition: String
    var tag: String? // optional
    
}

#Preview {
    FlashcardsView()
}
