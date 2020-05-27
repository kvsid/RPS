//
//  Sign.swift
//  RPS
//
//  Created by Xenia Sidorova on 13.03.2020.
//  Copyright © 2020 Xenia Sidorova. All rights reserved.
//

import Foundation
import GameplayKit

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case paper, rock, scissors
    
    var emoji: String {
        switch self {
        case .paper:
            return  "✋🏻"
        case .rock:
            return  "✊🏻"
        case .scissors:
            return  "✌🏻"
        }
    }
    
    func getResult(_ oposite: Sign) -> GameState {
        
        switch (self, oposite) {
        case (.rock, .rock),
             (.paper, .paper),
             (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
             (.paper, .rock),
             (.scissors, .paper):
                return .win
        default:
            return .lose
        }
    }
}
