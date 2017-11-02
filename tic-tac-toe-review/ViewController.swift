//
//  ViewController.swift
//  tic-tac-toe-review
//
//  Created by C4Q  on 10/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var brain = TicTacToeBrain()
    
    @IBAction func gameButtonPressed(_ sender: UIButton) {
        switch brain.player {
        case .one:
            sender.setTitle("X", for: .normal)
        case .two:
            sender.setTitle("O", for: .normal)
        }
        let column = sender.tag
        let row = sender.superview!.tag
        switch brain.enterMove(row: row, column: column) {
        case .victory(let winningPlayer):
            switch winningPlayer {
            case .one:
                messageLabel.text = "Player one wins!"
            case .two:
                messageLabel.text = "Player two wins!"
            }
        case .tie:
            messageLabel.text = "Tie!"
        case .onGoing(let newPlayer):
            switch newPlayer {
            case .one:
                messageLabel.text = "Player one's turn"
            case .two:
                messageLabel.text = "Player two's turn"
            }
        }
        sender.isUserInteractionEnabled = false
    }
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

