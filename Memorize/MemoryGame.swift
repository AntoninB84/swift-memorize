//
//  MemoryGame.swift
//  Memorize
//
//  Created by Antonin Billot on 14/07/1400 AP.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards: [Card]
    
    init(numberOfPairs: Int, createCardContent:(Int)->CardContent){
        cards = [Card]()
        
        for pairIndex in 0..<numberOfPairs{
            let cardContent:  CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, isfaceUp: false, isMatched: false, content: cardContent))
            cards.append(Card(id: pairIndex*2+1, isfaceUp: false, isMatched: false, content: cardContent))
        }
    }
    
    func choose(_ card : Card){
        
    }
    
    struct Card:Identifiable {
        var id: Int
        var isfaceUp : Bool
        var isMatched : Bool
        var content : CardContent
        
        
    }
}
