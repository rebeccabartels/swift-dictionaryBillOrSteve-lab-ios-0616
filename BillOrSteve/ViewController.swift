//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var facts: [String: [String]] = [:]
    var currentFact: (fact: String, subject: String)? = nil
    var correctGuesses = 0
    
    @IBOutlet weak var billButton: UIButton!
    
    @IBOutlet weak var steveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createfacts() //running the createfacts func.
       
           
            
            
                
        }
    func createfacts (){
        facts["Steve Jobs"] =
            [
                "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                "He was a pescetarian, meaning he ate no meat except for fish."]
        facts["Bill Gates"] = [
                "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                "He scored 1590 (out of 1600) on his SATs.",
                "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        print(facts)
    }
    
    func showFact() {
        currentFact = getRandomFact()
        if let currentFact = currentFact {
            factLabel.text = currentFact.fact
        } else {
            disableUI()
        }
    }
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var counter: UILabel!
    
    private func disableUI() {
        factLabel.text = ""
        steveButton.enabled = false  // you have to make the buttons into outlets for the enabled false to work. 
        billButton.enabled = false
    }
    
    private func makeGuess(guess: String) {
        if let currentFact = currentFact {
            if currentFact.subject == guess {
                correctGuesses += 1
                counter.text = "\(correctGuesses)"
            }
        }
        showFact()
    }
    
    func getRandomFact() -> (fact: String, subject: String)? {
        let subject = randomPerson()
        if let facts = facts[subject] {
            let idx = randomNumberFromZeroTo(facts.count)
            if idx < facts.count {
                let fact = facts[idx]
                return (fact: fact, subject: subject)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }

    @IBAction func steveButton(sender: UIButton) {
        makeGuess("Steve Jobs")
    }
  
    @IBAction func billButton(sender: UIButton) {
        makeGuess("Bill Gates")
    }
    
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
}

