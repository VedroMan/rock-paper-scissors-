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
    
    var losses = 0
    var wins = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        restartButton.isHidden = true
    }
    //логика записи побед которые будут выводиться на экран ввиде банера по окончанию игры
    
    func showBanner(result: GameState) {
        switch result {
        case .win:
            wins += 1
        case .lose:
            losses += 1
        case .draw:
            break
        default: break
            
        }
        
        //баннер выводящий результаты
        let alertController = UIAlertController(title: "Итоги игры", message: "Победы: \(wins) \nПроигрыши: \(losses)", preferredStyle: .alert )
        
        //кнопка для алерта
        alertController.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        
        //показ банера
        self.present(alertController, animated: true, completion: nil)
        
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
        restartButton.isHidden = false
        
        let result = sign.getResult(computerSign)
        
        showBanner(result: result)
  
//MARK: - тестовая штука
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.restartButton.isHidden = true     }
        
    }
    
    func restart() {
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        restartButton.isHidden = false
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
        restart()
    }
    
}

