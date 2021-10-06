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
    
    
    
    var indexOfFirstFaceUpCard : Int? {
        get{
            let faceUpCardsIndices = cards.indices.filter{
                index in
                return cards[index].isfaceUp && !cards[index].isMatched
            }
            if faceUpCardsIndices.count == 1{
                return faceUpCardsIndices.first
            }
            return nil
        }
        set{
            for index in cards.indices{
                if index == newValue || cards[index].isMatched{
                    cards[index].isfaceUp = true
                }else{
                    cards[index].isfaceUp = false
                }
            }
        }
    }
    
    // MARK: - MUTATING
    
    mutating func choose(_ card : Card){
        if let chosenIndex = index(of: card),
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
    
    
    func index(of card: Card)-> Int?{
        for index in cards.indices {
            if card.id == cards[index].id{
                return index
            }
        }
        return nil
    }
    
    struct Card:Identifiable{
        var id: Int
        var isfaceUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
        
        
    }
}
