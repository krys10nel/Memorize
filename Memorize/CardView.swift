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
            let shape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: Constants.lineWidth).foregroundColor(.gray)
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.inset)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            shape.fill(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
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

