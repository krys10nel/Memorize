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
    let theme: Theme
    let gradient: Gradient
    
    init(_ card: Card, _ theme: Theme) {
        self.card = card
        self.theme = theme
        self.gradient = Gradient(colors: [theme.color, theme.accentColor])
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp, theme: theme, gradient: gradient)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let inset: CGFloat = 5
        
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.4
            static let inset: CGFloat = 5
        }
    }
}


struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    //let themePrev = themes.first(where: {$0.name == "Halloween"})!
    static var previews: some View {
        VStack {
            HStack {
                CardView(Card(isFaceUp: true, content: "X", id: "test1"), themes.first(where: {$0.name == "Halloween"})!)
                CardView(Card(isFaceUp: false, content: "O", id: "test1"), themes.first(where: {$0.name == "Halloween"})!)
            }
            HStack {
                CardView(Card(isFaceUp: true, content: "O", id: "test1"), themes.first(where: {$0.name == "Halloween"})!)
                CardView(Card(isFaceUp: false, content: "X", id: "test1"), themes.first(where: {$0.name == "Halloween"})!)
            }
        }
            .padding()
    }
}

