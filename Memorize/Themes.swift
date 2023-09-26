//
//  Themes.swift
//  Memorize
//
//  Created by Krystene Maceda on 9/18/23.
//

/* Part of the Model
 * also UI Independent
 */

import SwiftUI

struct Theme {
    var name: String
    var emojis: [String]
    var color: Color
    var accentColor: Color
    var noOfPairs: Int?
}

let themes: [Theme] = [
    Theme(
        name: "Smileys",
        emojis: ["😃","😁","🥹","😅","😂","☺️","🙃","😍","🥰","😋","🤪","🤨","🤓","😎","🥸","🥳","😏","🙁","😩","😭","😤","😡","😳","😱"],
        color: .yellow,
        accentColor: .black
    ),
    
    Theme(
        name: "Vehicles",
        emojis: ["🚗","🚕","🚙","🚐","🚌","🏎️","🚑","🚒","🛻","🚚","🚛","🚜","🚃","🚂","✈️","🚀","🚁","🛸","🚤","🛵","🏍️","🛺","🛶","⛵️"],
        color: .white,
        accentColor: .gray,
        noOfPairs: 10
    ),
    
    Theme(
        name: "Halloween",
        emojis: ["👻","🎃","🕷","🧟‍♂️","🧛🏼‍♀️","☠️","👽","🦹‍♀️","🦇","🌘","⚰️","🔮"],
        color: .orange,
        accentColor: .red,
        noOfPairs: 10
    ),
    
    Theme(
        name: "Flags",
        emojis: ["🇸🇬","🇯🇵","🏴‍☠️","🏳️‍🌈","🇬🇧","🇹🇼","🇺🇸","🇦🇶","🇰🇵","🇭🇰","🇲🇨","🇼🇸"],
        color: .blue,
        accentColor: .red,
        noOfPairs: 10
    ),
    
    Theme(
        name: "Fruits",
        emojis: ["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍒","🍑","🥭","🍍","🥥","🥝","🍅","🥑"],
        color: .green,
        accentColor: .pink,
        noOfPairs: 10
    ),
    
    Theme(
        name: "Animals",
        emojis: ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🦁", "🐸"],
        color: .brown,
        accentColor: .gray,
        noOfPairs: 10
    )
]
