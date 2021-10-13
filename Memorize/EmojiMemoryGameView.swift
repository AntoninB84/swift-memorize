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
    
    var shape = RoundedRectangle(cornerRadius: 20)
    
    var body : some View {
        ZStack{
            if card.isfaceUp{
                
                shape.strokeBorder(lineWidth: 1, antialiased: true)
                
                Text(card.content)
                    .font(.title)
                    .fontWeight(.bold)
                
            }else{
                shape
                    .fill()
            }
        }
        .foregroundColor(.red)
        .opacity(card.isMatched ? 0 : 1)
    }
}

