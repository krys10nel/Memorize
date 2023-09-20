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
    var noOfPairs: Int?
}

let themes: [Theme] = [
    Theme(
        name: "Smileys",
        emojis: ["😃","😁","🥹","😅","😂","☺️","🙃","😍","🥰","😋","🤪","🤨","🤓","😎","🥸","🥳","😏","🙁","😩","😭","😤","😡","😳","😱"],
        color: .yellow
    ),
    
    Theme(
        name: "Vehicles",
        emojis: ["🚗","🚕","🚙","🚐","🚌","🏎️","🚑","🚒","🛻","🚚","🚛","🚜","🚃","🚂","✈️","🚀","🚁","🛸","🚤","🛵","🏍️","🛺","🛶","⛵️"],
        color: .red,
        noOfPairs: 10
    ),
    
    Theme(
        name: "Halloween",
        emojis: ["👻","🎃","🕷","🧟‍♂️","🧛🏼‍♀️","☠️","👽","🦹‍♀️","🦇","🌘","⚰️","🔮"],
        color: .orange,
        noOfPairs: 10
    ),
    
    Theme(
        name: "Flags",
        emojis: ["🇸🇬","🇯🇵","🏴‍☠️","🏳️‍🌈","🇬🇧","🇹🇼","🇺🇸","🇦🇶","🇰🇵","🇭🇰","🇲🇨","🇼🇸"],
        color: .gray,
        noOfPairs: 10
    ),
    
    Theme(
        name: "Fruits",
        emojis: ["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍒","🍑","🥭","🍍","🥥","🥝","🍅","🥑"],
        color: .green,
        noOfPairs: 10
    ),
    
    Theme(
        name: "Animals",
        emojis: ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🦁", "🐸"],
        color: .brown,
        noOfPairs: 10
    )
]
