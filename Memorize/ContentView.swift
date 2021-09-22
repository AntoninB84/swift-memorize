//
//  ContentView.swift
//  Memorize
//
//  Created by Antonin Billot on 31/06/1400 AP.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(lineWidth: 3, antialiased: true)
                
            Text("Hello")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
