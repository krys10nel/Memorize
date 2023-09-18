//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Krystene Maceda on 7/25/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Title.font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [ GridItem(.adaptive(minimum: 65)) ]) {
                    ForEach(viewModel.cards, id: \.self) { card in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                Spacer()
                VStack{
                    smileyButton
                    Text("Smiley")
                        .font(.body)
                }
                Spacer()
                VStack{
                    vehicleButton
                    Text("Vehicle")
                        .font(.body)
                }
                Spacer()
                VStack{
                    foodButton
                    Text("Food")
                        .font(.body)
                }
                Spacer()
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    var Title: some View{
        Text( "Memorize!" )
    }
    var vehicleButton: some View {
        Button {
            emojiUsed = vehicleEmojis.shuffled()
        } label: {
            Image(systemName: "car.circle")
        }
    }
    var smileyButton: some View {
        Button {
            emojiUsed = smileyEmojis.shuffled()
        } label: {
            Image(systemName: "person.crop.circle")
        }
    }
    var foodButton: some View {
        Button {
            emojiUsed = foodEmojis.shuffled()
        } label: {
            Image(systemName: "cart.circle")
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

//------------------------------------------------------------------------------//

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.light)
    }
}

