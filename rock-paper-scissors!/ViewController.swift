//
//  ViewController.swift
//  rock-paper-scissors!
//
//  Created by Timofey on 12.01.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ChangingRbtButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var restartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func play(_ sign: Sign) {
      let computerSign = randomSign()
        ChangingRbtButton.setTitle(computerSign.emojiValue, for: .normal)
        
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
    }
    
    //MARK: - IBAction
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(.rock)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(.paper)
    }
    
    @IBAction func restartButtonPressed(_ sender: Any) {
    }
    
}

