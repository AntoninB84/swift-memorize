//
//  ContentView.swift
//  Memorize
//
//  Created by Antonin Billot on 31/06/1400 AP.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗", "🚔", "🚄", "🚟", "🛩", "🛵", "🚲", "🛳", "⛵️", "🚁", "🚆", "🛴", "🏖","🏡","🏢","⛩","🏗","🏛","🕋","🏘","🛣","🌁"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            HStack{
                ForEach(0..<emojiCount, id: \.self){
                    CardView(content: emojis[$0])
                }
            }
            HStack(){
                addCard // appel de la var addCard
                Spacer() // Objet qui prend toute la place dispo dans l'axe englobant
                removeCard // Appel de la var removeCard
            }
        }
        .padding()
    }
    
    var addCard : some View{
        Button(
            action: {if emojiCount < emojis.count { emojiCount += 1 } },
            label: {
                Image(systemName: "plus.circle")
                    .font(.largeTitle)
        })
    }
    var removeCard : some View{
        Button(
            action: { if emojiCount > 0 {emojiCount -= 1} },
            label: {
            Image(systemName: "minus.circle")
                .font(.largeTitle)
        })
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

