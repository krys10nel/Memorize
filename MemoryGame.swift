//
//  MemoryGame.swift
//  Memorize
//
//  Created by Krystene Maceda on 7/28/23.
//

/* Model
 * UI Independent, always refer back to Model for "The Truth"
 */

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    // private(set) allows other parts of the code to observe cards, but not to set it
    private(set) var cards: Array<Card>
    var score = 0
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        shuffle()
    }
    
    var indexOfOnlyFaceUpCard: Int? {
        // .filter takes provides a function that takes the index and returns whether to include it or not
        get { return cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        let scoreMultiplier = Int(max(10 - (card.faceUpTime), 1))
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            // if not FaceUp or Matched
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfOnlyFaceUpCard {
                    // when two cards are flipped mark both cards as flipped
                    cards[chosenIndex].hasBeenFlipped += 1
                    cards[potentialMatchIndex].hasBeenFlipped += 1
                    // if both cards match, mark both cards as matched else decrease score when a third card is flipped (first two cards not matched)
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2 * scoreMultiplier
                    } else if  cards[chosenIndex].hasBeenFlipped > 1 || cards[potentialMatchIndex].hasBeenFlipped > 1 {
                        score -= 1
                    }
                    self.cards[chosenIndex].isFaceUp = true
                } else {
                    // case when only one card is flipped (after matching or when starting a new game)
                    indexOfOnlyFaceUpCard = chosenIndex
                }
            }
        }
    }
    
    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false {
            didSet {
                if isFaceUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        var isMatched = false
        let content: CardContent
        var hasBeenFlipped: Int = 0
        
        var lastFaceUpDate: Date?
        var pastFaceUpTime: TimeInterval = 0
        
        // when card is face down, records time interval from pastFaceUpTime and time interval since it was flipped over face up
        // if lastFaceUpDate is not nil, take the TimeInterval (seconds) of pastFaceUpTime and add time interval since the lastFaceUpDate
        var faceUpTime: TimeInterval {
            if let lastFaceUpDate = lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        
        // records lastFaceUpDate when card is face up
        private mutating func startUsingBonusTime() {
            if lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        // calls faceUpTime when card is face down
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            lastFaceUpDate = nil
        }
        
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? " matched" : "")"
            
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
