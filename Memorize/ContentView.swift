//
//  ContentView.swift
//  Memorize
//
//  Created by Antonin Billot on 31/06/1400 AP.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗", "🚔", "🚄", "🚟",
                  "🛩", "🛵", "🚲", "🛳",
                  "⛵️", "🚁", "🚆", "🛴",
                  "🏖","🏡","🏢","⛩",
                  "🏗","🏛","🕋","🏘",
                  "🛣","🌁","☎️","📟",
                  "📺","⌛️","📻","🥂",
                  "🍷","🏈","🍭","⚽️",
                  "🍼","🥜","🥤","🍫",
                  "🧂","🍽"]
    @State var emojiCount = 10
    
    var columns = [GridItem(.adaptive(minimum: 80, maximum: 100))]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns:columns){
                ForEach(0..<emojiCount, id: \.self){
                    CardView(content: emojis[$0])
                        .aspectRatio(2/3, contentMode: .fit) // Pour éviter que les cartes soient écrasées
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}

struct CardView : View{
    
    // Le mot clé @State permet de dire que la variable a une durée de vie plus longue que celle de la vue
    // et peut donc être utilisée plus longtemps que lors de la création de la vue
    @State var isFaceUp = true
    
    var content : String
    var shape = RoundedRectangle(cornerRadius: 20)
    
    var body : some View {
        ZStack{
            if isFaceUp{
                
                shape.strokeBorder(lineWidth: 1, antialiased: true)
                
                Text(content)
                    .font(.title)
                    .fontWeight(.bold)
                
            }else{
                shape
                    .fill()
            }
        }
        .foregroundColor(.red)
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
}

