//
//  resultViewController.swift
//  diagnostika
//
//  Created by Айсен Шишигин on 16/04/2020.
//  Copyright © 2020 Айсен Шишигин. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    // MARK: - Public properties
       var responses: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
        resultDefinitionLabel.layer.cornerRadius = resultDefinitionLabel.frame.width / 15
        resultAnswerLabel.layer.cornerRadius = resultAnswerLabel.frame.width / 15
    }
    
    
    private func updateResult() {
        var frequencyOfLocus: [LocusType : Int] = [:]
        let locus = responses.map{$0.type}
        
        for loc in locus {
            frequencyOfLocus[loc] = (frequencyOfLocus[loc] ?? 0) + 1
        }
        
        let sortedFrequensyOfLocus = frequencyOfLocus.sorted{$0.value > $1.value}
        guard  let mostFrequencyLocus = sortedFrequensyOfLocus.first?.key else {return}
        
        updateUI(with: mostFrequencyLocus)
    }
    
    
    
    private func updateUI(with locus: LocusType) {
        resultAnswerLabel.text = "У вас - \(locus.rawValue)"
        resultDefinitionLabel.text = "\(locus.definition)"
    }
}

 


