//
//  ContentView.swift
//  Memorize
//
//  Created by Antonin Billot on 31/06/1400 AP.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game : EmojiMemoryGame

    var body: some View {
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 80))]){
                ForEach(game.cards){
                    card in CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit) // Pour éviter que les cartes soient écrasées
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    static var previews: some View {
        EmojiMemoryGameView(game: game)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
            
    }
}

struct CardView : View{
    var card : EmojiMemoryGame.Card
    
    var body : some View {
        Text(card.content)
            .font(.title)
            .fontWeight(.bold)
            .cardify(isFaceUp: card.isfaceUp, isMatched: card.isMatched)
        
    }
}

