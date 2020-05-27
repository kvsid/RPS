//
//  ViewController.swift
//  RPS
//
//  Created by Xenia Sidorova on 13.03.2020.
//  Copyright © 2020 Xenia Sidorova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetButton.isHidden = true
    }
    
    func play (_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        resetButton.isHidden = false
        let result = sign.getResult(computerSign)
        switch result {
        case .win:
            statusLabel.text = "WIN!"
            self.view.backgroundColor = UIColor.green
            case .lose:
                statusLabel.text = "LOSE..."
            self.view.backgroundColor = UIColor.red
            case .draw:
                statusLabel.text = "DRAW"
            self.view.backgroundColor = UIColor.yellow
            case .start:
                reset()
        }
    }
    func reset() {
        robotButton.setTitle("👾", for: .normal)
        statusLabel.text = "ROCK,PAPER,SCISSORS?"
        self.view.backgroundColor = UIColor.white
        
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = true
        
    }
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(.rock)
    }
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(.paper)
    }
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
}

