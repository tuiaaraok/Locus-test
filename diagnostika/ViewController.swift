//
//  ViewController.swift
//  diagnostika
//
//  Created by Айсен Шишигин on 16/04/2020.
//  Copyright © 2020 Айсен Шишигин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var oneButton: UIButton!
    
    @IBOutlet var twoButton: UIButton!
    
    @IBOutlet var labelOne: UILabel!
    
    @IBOutlet var labelTwo: UILabel!
    
    // MARK: Private Properities
    
    private let answers1 = Answer.getAnswer()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
        oneButton.layer.cornerRadius = oneButton.frame.width / 15
        twoButton.layer.cornerRadius = twoButton.frame.width / 15
    }


    
    
    
    
    
   
    @IBAction func buttonPressed() {
        let currentAnswers = answers1[questionIndex]
        let currentIndex = 0
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
      nextQuestion()
       

    }
    
    @IBAction func twobuttonPressed() {
        let currentAnswers = answers1[questionIndex]
              let currentIndex = 1
              let currentAnswer = currentAnswers[currentIndex]
              answersChoosen.append(currentAnswer)
       
        nextQuestion()
    }
    
    private func updateUI() {
        let currentAnswers = answers1[questionIndex]
         guard let label1 = labelOne else {return}
         guard let label2 = labelTwo else { return  }
        label1.text = currentAnswers[0].text
        label2.text = currentAnswers[1].text
//        for two in answers1 {
//            guard let label1 = labelOne else {return}
//            guard let label2 = labelTwo else { return  }
//            label1.text = two[0].text
//            label2.text = two[1].text
//            guard let oneB = oneButton else {return}
//            guard let twoB = oneButton else {return}
//            oneB.setTitle(two[0].text, for: .normal)
//            twoB.setTitle(two[1].text, for: .normal)
             title = "Вопрос № \(questionIndex + 1) из \(answers1.count)"
     //   }
    }
   
    private func nextQuestion() {
          questionIndex+=1
        
           
           if questionIndex < answers1.count {
               updateUI()
           } else {
               performSegue(withIdentifier: "resultSegue", sender: nil)
           }
           
       }
       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           guard segue.identifier == "resultSegue" else {return}
           let resultVC = segue.destination as! resultViewController
           resultVC.responses = answersChoosen
       }
       
    
    
    
}

