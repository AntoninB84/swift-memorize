//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Antonin Billot on 31/06/1400 AP.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
