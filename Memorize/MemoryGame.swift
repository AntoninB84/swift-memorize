//
//  MemoryGame.swift
//  Memorize
//
//  Created by Antonin Billot on 14/07/1400 AP.
//

import Foundation

struct MemoryGame<CardContent: Equatable>{
    var cards: [Card]
    
    init(numberOfPairs: Int, createCardContent:(Int)->CardContent){
        cards = [Card]()
        
        for pairIndex in 0..<numberOfPairs{
            let cardContent:  CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, isfaceUp: false, isMatched: false, content: cardContent))
            cards.append(Card(id: pairIndex*2+1, isfaceUp: false, isMatched: false, content: cardContent))
        }
    }
    
    
    
    private var indexOfFirstFaceUpCard : Int? {
        get{
            cards.indices.filter{cards[$0].isfaceUp && !cards[$0].isMatched}.oneAndOnly()
        }
        set{
            cards.indices.forEach{ cards[$0].isfaceUp = $0 == newValue || cards[$0].isMatched}
        }
    }
    
    // MARK: - MUTATING
    
    mutating func choose(_ card : Card){
        if let chosenIndex = cards.firstIndex(where: {card.id == $0.id}),
           !cards[chosenIndex].isMatched,
           !cards[chosenIndex].isfaceUp{
            
            if let FirstFaceUpCard = indexOfFirstFaceUpCard{
                if cards[chosenIndex].content == cards[FirstFaceUpCard].content{
                    cards[chosenIndex].isMatched = true
                    cards[FirstFaceUpCard].isMatched = true
                }
                cards[chosenIndex].isfaceUp.toggle()
               
            }else{
                indexOfFirstFaceUpCard = chosenIndex
            }
        }
        
    }
    
    struct Card:Identifiable{
        let id: Int
        var isfaceUp : Bool = false
        var isMatched : Bool = false
        let content : CardContent
        
        
    }
}

extension Array{
    func oneAndOnly() -> Element?{
        if self.count == 1 {
            return self.first
        }
        return nil
    }
}
