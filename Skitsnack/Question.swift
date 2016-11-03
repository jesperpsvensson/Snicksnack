//
//  Question.swift
//  Skitsnack
//
//  Created by Jesper Svensson on 2016-04-16.
//  Copyright © 2016 Jesper Svensson. All rights reserved.
//


import Foundation

class Question {
    
    var timeCount = 30
    var points = 0
    var currentHighscore = 0
    var currentQuestion = 0
    var questionAsked = [Int]()
    var questionsArray = ["Sloveniens huvudstad heter Zagreb.",
                          "Silver är ett grundämne.",
                          "8 x 8 = 68",
                          "Emil i Lönnebergas syster heter Lisa",
                          "Vänstertrafik infördes i Sverige 1968",
                          "2006 hette Sveriges statsminister Göran Persson",
                          "8 x 6 = 46",
                          "Europa är den kontinent med minst area",
                          "Kon har fyra magar",
                          "J.K. Rowling har skrivit böckerna om Harry Potter",
                          "I Sverige finns 40 arter av humlor",
                          "USAs första president hette Abraham Lincoln",
                          "Irland har flest vinster i Eurovision Song Contest",
                          "Charophobi är rädsla för att dansa",
                          "Spanska är väldens mest talade språk",
                          "Lærdalstunneln som är 24,5 km lång, är världens längsta",
                          "16 x 3 = 48",
                          "Rådjursbocken har horn året om",
                          "1 msk = 15 ml",
                          "Venus är planeten närmast solen i vårt solsystem",
                          "Juli och Augusti har 31 dagar",
                          "Sveriges riksdag har 349 ledamöter",
                          "Älgen är Ångermanlands landskapsdjur",
                          "EU har 28 medlemsländer",
                          "Rödhake är ett verktyg som används av målare",
                          "133 + 167 = 300",
                          "Staden Albany är huvudstad i staten New York",
                          "Kansas City ligger i den ameriskanska delstaten Missouri",
                          "Låten Save Tonight som kom 1998 sjöngs av Eagle-Eye Cherry",
                          "Ett tjog består av 12 st",
                          "Colombias huvudstad heter Bogota",
                          "Prästkragens blomma är vit och röd",
                          "Italiens flagga är grön, vit och röd",
                          "Tomaten tillhör potatissläktet",
                          "Den första iPhonen lanserades 2007",
                          "1 knop = 2 km/h",
                          "I Finland kallas midsommar för Juhannus",
                          "Sven Wollters rollfigur i filmen Änglagård heter Axel Flogfält",
                          "Det bor fler på Island än i Göteborg",
                          "3 x 45 = 145",
                          "Sverige är indelat i 290 kommuner",
                          "Oliver Twist är en roman skriven av Agatha Christie",
                          "Jordens dragningskraft är mindre vid ekvatorn än vid polerna",
                          "USA består av 52 delstater",
                          "Los Angeles ligger på samma latitud som Beirut, Libanon och Kabul, Afganistan",
                          "Hästkraft, hk, är en måttenhet för effekt",
                          "Jordens befolkning är räknad till ca 10 miljarder människor",
                          "Fotbolls-VM infaller vart fjärde år",
                          "4 + 4 x 3 = 28",
                          "Storleken på ett A4-ark är 210 x 297 mm",
                          "100 meter = 10 000 millimeter",
                          "Björn Borg vann under sin karriär 5 raka Wimbledon",
                          "Argentina är det land med flest VM-guld i fotboll"]
    
    var answers = [0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1,
                   1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0,
                   1, 0, 1, 0]

    func askQuestion() -> String {
        let randInt = generateNum()
        let question = questionsArray[randInt]
        return question
    }
    
    func returnNum(_ randInt: Int) -> Int {
        return randInt
    }
    
    func generateNum() -> Int {
        var randInt = 0
        var i = false
        while i == false {
            randInt = Int(arc4random_uniform(UInt32(questionsArray.count)))
            if !questionAsked.contains(randInt) {
                questionAsked.append(randInt)
                currentQuestion = randInt
                i = true
            }
        }
        return randInt
    }
    
    func checkAnswer(_ answer: Int) {
        let correctAnswer = answers[currentQuestion]
        if answer == correctAnswer {
            points = points + 1
            print("rätt")
        } else {
            print("fel")
        }
        
    }
    
    func updateTimeLbl() -> String {
        timeCount = timeCount - 1
        return "Tid: \(timeCount)"
    }
    
    func endPoints() -> Int {
        return points
    }
    
    func restartGame() {
        timeCount = 30
        points = 0
        currentQuestion = 0
        questionAsked.removeAll()
    }
    
    func saveHighscore() {
        let postsData = NSKeyedArchiver.archivedData(withRootObject: points)
        UserDefaults.standard.set(postsData, forKey: "highscore")
        UserDefaults.standard.synchronize()
    }
    
    func loadHighscore() {
        if let postData = UserDefaults.standard.object(forKey: "highscore") as? Data {
            if let highscore = NSKeyedUnarchiver.unarchiveObject(with: postData) as? Int {
                currentHighscore = highscore
                
            }
        }
    }
    
    func checkHighscore() {
        if points > currentHighscore {
            saveHighscore()
        } 
    }
    
}
