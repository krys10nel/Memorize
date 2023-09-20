//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Krystene Maceda on 7/25/23.
//

/* View
 * Supposed to be stateless (no @State)
 * Declared and Reactive, only lists views
 * when ViewModel publishes "something changed", it automatically observes publications, pulls data and rebuilds
 */

import SwiftUI

struct EmojiMemoryGameView: View {
    // @State var inside a view will come into existence when view is drawn on screen and then ends when view is no longer on screen. @State var's lifetime is tied to the lifetime of the view
    // When @State var is put in app, it's lifetime is tied to the lifetime of the app
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    // @ViewBuilder is implicit in var body view protocol
    var body: some View {
        NavigationView {
            VStack {
                cards
                    .animation(.default, value: viewModel.cards)
                Button {
                    self.viewModel.newGame()
                } label: {
                    Text("New Game")
                        .font(.title)
                }
            }
            .navigationBarTitle(viewModel.theme.name)
            .padding()
        }
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(viewModel.theme.color)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)
            Group {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            shape.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

//------------------------------------------------------------------------------//

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.light)
    }
}

