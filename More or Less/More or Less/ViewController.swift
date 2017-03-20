//
//  ViewController.swift
//  More or Less
//
//  Created by Chas Steinbrugge on 3/19/17.
//  Copyright © 2017 Chas Steinbrugge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var numberInput: UITextField!
    
    var guessArray: [String] = [""]
    
    var gameIsRunning = true
    
    var hiddenNumber = arc4random_uniform(999) + 1
    
    var guessAmount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        defaults.set(999, forKey: "highscore")
        defaults.integer(forKey: "highscore")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func guessPressed(_ sender: Any) {
        
        //checks to see if error message has been moved down the row of labels
        if guessArray[1] == "Please enter a number before guessing."{
            guessArray.remove(at: 1)
        }
        
        //check if game is running
        if gameIsRunning == false{
            gameIsRunning = true
            guessButton.setTitle("Guess", for: .normal)
            emptyGuessArray()

        } else if UInt32(numberInput.text!) == nil{
            //if no value entered, this code will run:
            if guessArray[0] != "Please enter a number before guessing."{
                //^checks to see if error has already been presented
                //if the error hasn't been presented, this code will run:
                guessArray.insert("Please enter a number before guessing.", at:0)
            fillLabels()
            }
        } else{
        
        
        let numberGuessed = UInt32(numberInput.text!)
        guessAmount += 1
        topLabel.text = "Attempt #\(guessAmount)"
        
        
        if numberGuessed == hiddenNumber{
            //guessed correctly

            //stop game
            gameIsRunning = false
            
            //empty array
            emptyGuessArray()
            
            //set highcore
            if guessAmount < UserDefaults.standard.integer(forKey: "highscore") {
                UserDefaults.standard.set(999, forKey: "highscore")            }
            
            //correct statment, score, highscore
            guessArray.insert("The number is \(numberGuessed!)!!!", at:0)
            guessArray.insert("Score: \(guessAmount)", at:1)
            guessArray.insert("Highscore: \(UserDefaults.standard.integer(forKey: "highscore"))", at:2)
            
            //change button from guess to start over
            guessButton.setTitle("START OVER", for: .normal)
            
            //reset score
            guessAmount = 0
            
            
        } else if numberGuessed! < hiddenNumber{
            //guessed below
            guessArray.insert("The number is MORE than \(numberGuessed!).", at:0)
        } else if numberGuessed! > hiddenNumber{
            //guessed above
            guessArray.insert("The number is LESS than \(numberGuessed!).", at:0)
        }
        
        

        fillLabels()
    }
    }


    func fillLabels(){
        if guessArray.count >= 1{
    label1.text = guessArray[0]
        if guessArray.count >= 2{
    label2.text = guessArray[1]
        if guessArray.count >= 3{
    label3.text = guessArray[2]
        if guessArray.count >= 4{
    label4.text = guessArray[3]
        if guessArray.count >= 5{
    label5.text = guessArray[4]
        if guessArray.count >= 6{
    label6.text = guessArray[5]
        if guessArray.count >= 7{
    label7.text = guessArray[6]
        if guessArray.count >= 8{
    label8.text = guessArray[7]
        if guessArray.count >= 9{
    label9.text = guessArray[8]
        if guessArray.count >= 10{
    label10.text = guessArray[9]
        if guessArray.count >= 11{
    label11.text = guessArray[10]
        }
        }
        }
        }
        }
        }
        }
        }
        }
        }
        }
    }
    
    func emptyGuessArray(){
        guessArray.removeAll()
        guessArray = ["","","","","","","","","","",""]
        fillLabels()
    }
    
}



