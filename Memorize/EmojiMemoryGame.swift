//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Antonin Billot on 14/07/1400 AP.
//

import SwiftUI


//VIEWMODEL


class EmojiMemoryGame : ObservableObject{
    typealias Card = MemoryGame<String>.Card
    
    private static var emojis = ["🚗", "🚔", "🚄", "🚟",
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
        numberOfPairs : 10,
        createCardContent:{ pairIndex in emojis[pairIndex] })
    
    var cards: [Card]{
        return model.cards
    }
    
    // MARK: - Intents -
    
    func choose(_ card: Card){
        model.choose(card)
    }
    func turnDownCardIfNeeded(){
        model.turnDownCardsIfNeeded()
    }
    func shuffle(){
        model.shuffle()
    }
    
}
