//
//  ContentView.swift
//  Memorize
//
//  Created by Krystene Maceda on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    let vehicleEmojis = ["🚗","🚕","🚙","🚐","🚌","🏎️","🚑","🚒","🛻","🚚","🚛","🚜","🚃","🚂","✈️","🚀","🚁","🛸","🚤","🛵","🏍️","🛺","🛶","⛵️"]
    let smileyEmojis = ["😃","😁","🥹","😅","😂","☺️","🙃","😍","🥰","😋","🤪","🤨","🤓","😎","🥸","🥳","😏","🙁","😩","😭","😤","😡","😳","😱"]
    let foodEmojis = ["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍒","🍑","🥭","🍍","🥥","🥝","🍅","🍆","🥑","🫛","🌶️","🌽","🥕","🥔","🍠"]
    @State var emojiCount = 10
    @State var emojiUsed: [String] = ["🚗","🚕","🚙","🚐","🚌","🏎️","🚑","🚒","🛻","🚚","🚛","🚜","🚃","🚂","✈️","🚀","🚁","🛸","🚤","🛵","🏍️","🛺","🛶","⛵️"]
    
    var body: some View {
        VStack {
            Title.font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [ GridItem(.adaptive(minimum: 65)) ]) {
                    ForEach(emojiUsed[0..<emojiCount], id: \.self) { emoji in
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
    /*var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }*/
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
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
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

//------------------------------------------------------------------------------//

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}

