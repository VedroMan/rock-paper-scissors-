//
//  Sign.swift
//  rock-paper-scissors!
//
//  Created by Timofey on 12.01.24.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}
    
    enum Sign {
        case rock, paper, scissors
        
        var emojiValue: String {
            switch self {
            case .paper:
                return "📄"
            case .rock:
                return "🪨"
            case .scissors:
                return "✂️"
            }
        }
        
        func getResult (_ oposite: Sign) -> GameState {
            
            switch self {
            case .rock:
                switch oposite {
                case .rock:
                    return .draw
                case .paper:
                    return .lose
                case .scissors:
                    return .win
                }
            case .paper:
                switch oposite {
                case .paper:
                    return .draw
                case .scissors:
                    return .lose
                case .rock:
                    return .win
                }
            case .scissors:
                switch oposite {
                case .scissors:
                    return .draw
                case .rock:
                    return .lose
                case .paper:
                    return .win
                }
            }
            
        }
        
    }
