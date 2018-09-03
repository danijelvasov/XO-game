//
//  Data.swift
//  XO game
//
//  Created by OSX on 8/24/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import UIKit

   


func findWinner(player1Score: [Int], player2Score: [Int]) -> Int {
    var winner = 0
    if (player1Score.contains(1) && player1Score.contains(2) && player1Score.contains(3)){
        winner = 1
    }
    if (player2Score.contains(1) && player2Score.contains(2) && player2Score.contains(3)){
        winner = 2
    }
    
    if (player1Score.contains(4) && player1Score.contains(5) && player1Score.contains(6)){
        winner = 1
    }
    
    if (player2Score.contains(4) && player2Score.contains(5) && player2Score.contains(6)){
        winner = 2
    }
    
    if (player1Score.contains(7) && player1Score.contains(8) && player1Score.contains(9)){
        winner = 1
    }
    
    if (player2Score.contains(7) && player2Score.contains(8) && player2Score.contains(9)){
        winner = 2
    }
    //column
    if (player1Score.contains(1) && player1Score.contains(4) && player1Score.contains(7)){
        winner = 1
    }
    
    if (player2Score.contains(1) && player2Score.contains(4) && player2Score.contains(7)){
        winner = 2
    }
    
    if (player1Score.contains(2) && player1Score.contains(5) && player1Score.contains(8)){
        winner = 1
    }
    
    if (player2Score.contains(2) && player2Score.contains(5) && player2Score.contains(8)){
        winner = 2
    }
    
    if (player1Score.contains(3) && player1Score.contains(6) && player1Score.contains(9)){
        winner = 1
    }
    
    if (player2Score.contains(3) && player2Score.contains(6) && player2Score.contains(9)){
        winner = 2
    }
    
    if (player1Score.contains(1) && player1Score.contains(5) && player1Score.contains(9)){
        winner = 1
    }
    
    if (player2Score.contains(1) && player2Score.contains(5) && player2Score.contains(9)){
        winner = 2
    }
    
    if (player1Score.contains(3) && player1Score.contains(5) && player1Score.contains(7)){
        winner = 1
    }
    
    if (player2Score.contains(3) && player2Score.contains(5) && player2Score.contains(7)){
        winner = 2
    }
    return winner
}
