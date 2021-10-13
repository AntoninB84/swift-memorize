//
//  Cardify.swift
//  Memorize
//
//  Created by Antonin Billot on 21/07/1400 AP.
//

import SwiftUI

struct Cardify : ViewModifier{
    var isFaceUp : Bool
    var isMatched : Bool
    
    func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        
        ZStack{
            if isFaceUp{
                shape.strokeBorder(lineWidth: 1, antialiased: true)
                content
            }else{
                shape.fill()
            }
        }
        .foregroundColor(.red)
        .opacity(isMatched ? 0 : 1)
    }
}

extension View {
    func cardify(isFaceUp : Bool, isMatched: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, isMatched: isMatched))
    }
}
