//
//  TicTacToeBrain.swift
//  tic-tac-toe-review
//
//  Created by C4Q  on 10/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation


enum GameState {
    case victory(Player)
    case tie
    case onGoing(Player)
}

enum Player {
    case one
    case two
}

class TicTacToeBrain {
    private enum ButtonState {
        case x, o, empty
    }
    var player: Player = .one
    
    private var board: [[ButtonState]] = [[.empty, .empty, .empty],
                                          [.empty, .empty, .empty],
                                          [.empty, .empty, .empty]]
    func enterMove(row: Int, column: Int) -> GameState {
        switch player {
        case .one:
            board[row][column] = .x
        case .two:
            board[row][column] = .o
        }
        //Check for victory
        self.player = (player == .one) ? .two : .one
        let newState = victoryCheck()
        return newState
    }
    private func victoryCheck() -> GameState {
        //horizontal
        /*
        for player in [ButtonState.x, ButtonState.o] {
            for row in board {
                 if row[0] == player && row[1] == player && row[2] == player {
                     return .victory(player == .x ? .one : .two)
                 }
             }
        }
         */
        for row in board {
            if row[0] == .x && row[1] == .x && row[2] == .x {
                return .victory(.one)
            }
            if row[0] == .o && row[1] == .o && row[2] == .o {
                return .victory(.two)
            }
        }
        //vertical
        for column in 0..<board.count {
            if board[0][column] == .x && board[1][column] == .x && board[2][column] == .x {
                return .victory(.one)
            }
            if board[0][column] == .o && board[1][column] == .o && board[2][column] == .o {
                return .victory(.two)
            }
        }
        //diagonal
        if (board[0][0] == .x && board[1][1] == .x && board [2][2] == .x) || (board[2][0] == .x && board[1][1] == .x && board [0][2] == .x) {
            return .victory(.one)
        }
        if (board[0][0] == .o && board[1][1] == .o && board [2][2] == .o) || (board[2][0] == .o && board[1][1] == .o && board [0][2] == .o) {
            return .victory(.two)
        }
        //In progress
        for row in board {
            for column in row {
                if column == .empty {
                    return .onGoing(self.player)
                }
            }
        }
        //Tie
        return .tie
    }
}

 