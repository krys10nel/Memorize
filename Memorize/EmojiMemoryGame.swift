//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Krystene Maceda on 7/28/23.
//

/* View Model
 * binds View to the Model
 * when something in the Model changes, ViewModel publishes "something changed"
 * handles user intent
 */

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis: Array<String> = theme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: theme.noOfPairs ?? Int.random(in: 4...6)) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    // private type controls View's access directly to Model. Without private, View can talk directly to Model
    // @Published marks vars that can change
    @Published private var model: MemoryGame<String>
    
    // it becomes ViewModel's responsibility to provide cards (and intents) to View since it now controls View's access to Model
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    var theme = themes.randomElement()!
    
    init() {
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}


