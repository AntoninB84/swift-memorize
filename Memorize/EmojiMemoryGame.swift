//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Antonin Billot on 14/07/1400 AP.
//

import SwiftUI


//VIEWMODEL


class EmojiMemoryGame : ObservableObject{
    
    static var emojis = ["🚗", "🚔", "🚄", "🚟",
                  "🛩", "🛵", "🚲", "🛳",
                  "⛵️", "🚁", "🚆", "🛴",
                  "🏖","🏡","🏢","⛩",
                  "🏗","🏛","🕋","🏘",
                  "🛣","🌁","☎️","📟",
                  "📺","⌛️","📻","🥂",
                  "🍷","🏈","🍭","⚽️",
                  "🍼","🥜","🥤","🍫",
                  "🧂","🍽"]
    
    @Published private var model:MemoryGame<String> = MemoryGame<String>(
        numberOfPairs : 4,
        createCardContent:{ pairIndex in emojis[pairIndex] })
    
    var cards: [MemoryGame<String>.Card]{
        return model.cards
    }
    
    // MARK: - Intents -
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
