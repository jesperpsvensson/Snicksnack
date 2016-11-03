//
//  startVC.swift
//  Skitsnack
//
//  Created by Jesper Svensson on 2016-04-17.
//  Copyright © 2016 Jesper Svensson. All rights reserved.
//

import UIKit

class startVC: UIViewController {

    @IBOutlet weak var highscoreLbl: UILabel!
    @IBOutlet weak var logoImg: UIImageView!
    
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var startBtn: roundedBtn!
    @IBOutlet weak var nameLbl: logoLbl!
    
    var darkTheme = true
    
    var game = Question()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHighscore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadHighscore()
        highscoreLbl.center.x  -= view.bounds.width
        logoImg.center.y -= view.bounds.width
        nameLbl.center.y -= view.bounds.width
        startBtn.center.y += view.bounds.width
        moreBtn.center.y += view.bounds.width
        
        UIView.animate(withDuration: 0.3, animations: {
            self.highscoreLbl.center.x += self.view.bounds.width
            self.logoImg.center.y += self.view.bounds.width
            self.nameLbl.center.y += self.view.bounds.width
            self.startBtn.center.y -= self.view.bounds.width
            self.moreBtn.center.y -= self.view.bounds.width
        })
        
    }

    func loadHighscore() {
        game.loadHighscore()
        highscoreLbl.text = "Högsta poäng: \(game.currentHighscore)"
    }
    

}
