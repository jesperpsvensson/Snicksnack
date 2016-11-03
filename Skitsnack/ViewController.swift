//
//  ViewController.swift
//  Skitsnack
//
//  Created by Jesper Svensson on 2016-04-07.
//  Copyright © 2016 Jesper Svensson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var restartBtn: roundedBtn!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var quitBtn: UIButton!
    
    var timer: Timer!
    var timer2: Timer!
    var game = Question()

    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestion()
        startTimer()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(ViewController.stopGame), userInfo: nil, repeats: false)
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        timeLbl.text = game.updateTimeLbl()
    }
    
    func stopGame() {
        timer2.invalidate()
        game.checkHighscore()
        questionLbl.text = "Bra jobbat!\n\nPoäng: \(game.endPoints())"
        timeLbl.text = "Tid: 0"
        trueBtn.isHidden = true
        falseBtn.isHidden = true
        restartBtn.isHidden = false
        
    }
    
    func setQuestion() {
        questionLbl.text = game.askQuestion()
    }

    @IBAction func answerBtnTapped(_ sender: AnyObject) {
        game.checkAnswer(sender.tag)
        setQuestion()
        pointsLbl.text = "Poäng: \(game.points)"
    }
    
    @IBAction func quitBtnTapped(_ sender: AnyObject) {
        timer2.invalidate()
        timer.invalidate()
        dismiss(animated: true, completion: nil)
    }

    @IBAction func restartBtnPressed(_ sender: AnyObject) {
        game.restartGame()
        trueBtn.isHidden = false
        falseBtn.isHidden = false
        restartBtn.isHidden = true
        setQuestion()
        startTimer()
    }

}

