//
//  Cardify.swift
//  Memorize
//
//  Created by Krystene Maceda on 10/2/23.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    var theme: Theme
    var gradient: Gradient

    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            shape.strokeBorder(lineWidth: Constants.lineWidth)
                .background(shape.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            shape.fill(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(isFaceUp ? 0 : 1)
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool, theme: Theme, gradient: Gradient) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp, theme: theme, gradient: gradient))
    }
}
