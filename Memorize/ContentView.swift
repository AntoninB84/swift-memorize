//
//  ContentView.swift
//  Memorize
//
//  Created by Antonin Billot on 31/06/1400 AP.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel : EmojiMemoryGame

    var body: some View {
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 100))]){
                ForEach(viewModel.cards){
                    card in CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit) // Pour éviter que les cartes soient écrasées
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    static var previews: some View {
        ContentView(viewModel: game)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            
    }
}

struct CardView : View{
    var card : MemoryGame<String>.Card
    
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
    }
}

