//
//  Concentration.swift
//  FlipCard
//
//  Created by Teaocat on 2018/3/14.
//  Copyright © 2018年 learning-swift. All rights reserved.
//
//  Github: https://github.com/teaocat
//
    

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfParisOfCards: Int) {
        for _ in 1...numberOfParisOfCards {
            let card = Card()
            cards += [card, card]
        }
        for _ in cards.indices {
            let popIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let insertIndex = Int(arc4random_uniform(UInt32(cards.count - 1)))
            cards.insert(cards.remove(at: popIndex), at: insertIndex)
        }
        // TODO: Shuffle the cards
        Card.identifierFactory = 0
    }
    
}
