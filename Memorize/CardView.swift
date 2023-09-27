//
//  CardView.swift
//  Memorize
//
//  Created by Krystene Maceda on 9/26/23.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    let card: Card
    let gradient: Gradient
    
    init(_ card: Card, _ theme: Theme) {
        self.card = card
        self.gradient = Gradient(colors: [theme.color, theme.accentColor])
    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)
            Group {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3).foregroundColor(.gray)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            shape.fill(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}


struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    static var previews: some View {
        VStack {
            HStack {
                CardView(Card(isFaceUp: true, content: "X", id: "test1"), themes.first(where: { $0.name == "Halloween" })!)
                CardView(Card(isFaceUp: false, content: "O", id: "test1"), themes.first(where: { $0.name == "Halloween" })!)
            }
            HStack {
                CardView(Card(isFaceUp: true, content: "O", id: "test1"), themes.first(where: { $0.name == "Halloween" })!)
                CardView(Card(isFaceUp: false, content: "X", id: "test1"), themes.first(where: { $0.name == "Halloween" })!)
            }
        }
            .padding()
    }
}
