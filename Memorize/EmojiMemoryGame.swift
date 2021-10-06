//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Antonin Billot on 14/07/1400 AP.
//

import SwiftUI

class EmojiMemoryGame{
    
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
    
    var model:MemoryGame<String> = MemoryGame<String>(
        numberOfPairs : 4,
        createCardContent:{ pairIndex in emojis[pairIndex] })
    
    var cards: [MemoryGame<String>.Card]{
        return model.cards
    }
    
}
