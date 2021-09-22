//
//  ContentView.swift
//  Memorize
//
//  Created by Antonin Billot on 31/06/1400 AP.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
            CardView()
            CardView()
            CardView(isFaceUp: false)
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
    
    var shape = RoundedRectangle(cornerRadius: 20)
    
    var body : some View {
        ZStack{
            if isFaceUp{
                
                shape.fill(Color.yellow)
                
                shape.strokeBorder(lineWidth: 5, antialiased: true)
                
                Text("🚗")
                    .font(.title)
                    .fontWeight(.bold)
                
            }else{
                shape
            }
        }
        .foregroundColor(.red)
        .padding()
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
}
