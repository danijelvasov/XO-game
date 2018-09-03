//
//  ViewController.swift
//  XO game
//
//  Created by OSX on 8/24/18.
//  Copyright © 2018 OSX. All rights reserved.
//
// UPDATE
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var constraintMenu: NSLayoutConstraint!
    @IBOutlet weak var stackConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuBtnsTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuButtonsStack: UIStackView!
    @IBOutlet weak var menuButton: UIButton!
    
    var activePlayer = 1
    var player1Score = [Int]()
    var player2Score = [Int]()
    var usedFields = [Int]()
    var availableFields = [Int]()
    var winner = 0
    var menuIsOpen = false
    var playingWithRobot = true
    var internalButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //menuButtonsStack.isHidden = false
        stackConstraint.constant = 0
        constraintMenu.constant = 0
        menuBtnsTrailingConstraint.constant = 267
        restartGame(buttons: getButtons())
    }
    
    
    @IBAction func multiplayerButtonPressed(_ sender: Any) {
            playWithFriend()
    }
    
    @IBAction func computerButtonPressed(_ sender: Any) {
            playVSrobot()
    }
    
    @IBAction func restartBtnPressed(_ sender: Any) {
        restartGame(buttons: getButtons())
        menuBtnPressed(internalButton as Any)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let button = sender
        playGame(selectedButton: button)
    }
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        menuIsOpen = !menuIsOpen
        constraintMenu.constant = menuIsOpen ? 55 : 0
        menuBtnsTrailingConstraint.constant = menuIsOpen ? 16 : 267
        stackConstraint.constant = menuIsOpen ? 270 : 0
        animateView()
    }
    

    func playGame(selectedButton: UIButton){
        if activePlayer == 1 {
            selectedButton.setTitle("X", for: .normal)
            print("title \(String(describing: selectedButton.titleLabel))")
            player1Score.append(selectedButton.tag)
            usedFields.append(selectedButton.tag)
            selectedButton.isEnabled = false
            if playingWithRobot == false {
                activePlayer = 2
            }
            if playingWithRobot == true {
                autoPlay()
                checkResults()
            }
            
        } else if activePlayer == 2 {
            selectedButton.setTitle("O", for: .normal)
            player2Score.append(selectedButton.tag)
            usedFields.append(selectedButton.tag)
            selectedButton.isEnabled = false
            playingWithRobot = false
            activePlayer = 1
        }
        selectedButton.isEnabled = false
        checkResults()
    }
    

    
    func autoPlay() {
        availableFields = []
            for index in 1...9 {
                if !usedFields.contains(index) {
                    availableFields.append(index)
                }
            }
            let random = arc4random_uniform(UInt32(availableFields.count))
                if usedFields.count < 10 && availableFields.count > 0{
            let selectedField = availableFields[Int(random)]
            let buttonAutoPressed : UIButton?
            switch selectedField {
                case 1: buttonAutoPressed = btn1
                case 2: buttonAutoPressed = btn2
                case 3: buttonAutoPressed = btn3
                case 4: buttonAutoPressed = btn4
                case 5: buttonAutoPressed = btn5
                case 6: buttonAutoPressed = btn6
                case 7: buttonAutoPressed = btn7
                case 8: buttonAutoPressed = btn8
                case 9: buttonAutoPressed = btn9
                default: return
            }
                buttonAutoPressed!.setTitle("O", for: .normal)
                buttonAutoPressed!.isEnabled = false
                player2Score.append(buttonAutoPressed!.tag)
                usedFields.append(buttonAutoPressed!.tag)
                playingWithRobot = true
                activePlayer = 1
        }
    }
    
    
    func checkResults() {
        winner = findWinner(player1Score: player1Score, player2Score: player2Score)
        if winner != 0 || usedFields.count == 9 {
            var message = ""
            if winner == 1 {
                message = "PLAYER 1 IS WINNER!"
            }
            if winner == 2 {
                message = "PLAYER 2 IS WINNER!"
            }
            if winner == 0 && usedFields.count == 9 {
                message = "NO WINNER IN THIS GAME"
            }
            let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Restart", style: .default) { (dismiss) in
                self.restartGame(buttons: self.getButtons())
            }
            alert.addAction(dismissAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
 
    func restartGame(buttons: [UIButton]){
        activePlayer = 1
        player1Score = []
        player2Score = []
        usedFields = []
        playingWithRobot = true
        winner = 0
        buttons.forEach { $0.setTitle("", for: .normal); $0.isEnabled = true }
    }
    
    func getButtons() -> [UIButton] {
        return [btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9]
    }
    
    func playWithFriend(){
        activePlayer = 1
        restartGame(buttons: getButtons())
        playingWithRobot = false
        menuBtnPressed(internalButton as Any)
    }
    
    func playVSrobot(){
        playingWithRobot = true
        menuBtnPressed(internalButton as Any)
    }
    
    func animateView(){
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 9.0,
                       options: [],
                       animations: {
                        let angle: CGFloat = self.menuIsOpen ? .pi / 2 : 0.0
                        self.menuButton.transform = CGAffineTransform(rotationAngle: angle)
                        self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    
}

