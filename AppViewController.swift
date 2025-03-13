//
//  AppViewController.swift
//  Trivia
//
//  Created by Ibrahima Diallo on 3/12/25.
//

import UIKit
import Foundation

struct Question {
    let text: String
    let options: [String]
    let correctOptionIndex: Int
}
class AppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentQuestion()

        // Do any additional setup after loading the view.
    }
    
   // @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var EntertaimentLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var option1Button: UILabel!
    @IBOutlet weak var option2Button: UILabel!
    @IBOutlet weak var option3Button: UILabel!
    @IBOutlet weak var option4Button: UILabel!
    
    var questions: [Question] = [
            Question(text: "What is the capital of France?", options: ["Paris", "London", "Berlin", "Madrid"], correctOptionIndex: 0),
            Question(text: "What is 2 + 2?", options: ["3", "4", "5", "6"], correctOptionIndex: 1)
        ]
        var currentQuestionIndex: Int = 0


        func displayCurrentQuestion() {
            let currentQuestion = questions[currentQuestionIndex]
            questionLabel.text = currentQuestion.text
            option1Button.setTitle(currentQuestion.options[0], for: .normal)
            option2Button.setTitle(currentQuestion.options[1], for: .normal)
            option3Button.setTitle(currentQuestion.options[2], for: .normal)
            option4Button.setTitle(currentQuestion.options[3], for: .normal)
        }

        @IBAction func optionButtonTapped(_ sender: UIButton) {
            let currentQuestion = questions[currentQuestionIndex]
            if let buttonIndex = [option1Button, option2Button, option3Button, option4Button].firstIndex(of: sender) {
                if buttonIndex == currentQuestion.correctOptionIndex {
                    print("Correct!")
                } else {
                    print("Incorrect!")
                }
            }
            currentQuestionIndex = (currentQuestionIndex + 1) % questions.count
            displayCurrentQuestion()
        }
    }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


