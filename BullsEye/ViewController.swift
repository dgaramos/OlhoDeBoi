//
//  ViewController.swift
//  BullsEye
//
//  Created by Danilo Ramos on 28/09/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var displayTargetValue: UILabel!
    @IBOutlet weak var displayScore: UILabel!
    @IBOutlet weak var displayRound: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        
        let thumbImageNormal = UIImage(named: "BullsEye")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageSelected = UIImage(named: "BullsEyeSelected")!
        slider.setThumbImage(thumbImageSelected, for: .highlighted)
    }
    
    @IBAction func showAlert() {
        let difference: Int = abs(targetValue - currentValue)
        let points: Int
        
        let title: String
        
        if difference == 0 {
            title = "Brocador!"
            points = 200
        } else if difference < 5 {
            title = "Quase hein?"
            points = 150 - difference
        } else if difference < 10 {
            title = "Marromenos!"
            points = 100 - difference
        } else {
            title = "Mermão!! Foi longe!"
            points = 0
        }
        
        score = score + points
        
        let message = "\nSua pontuação nessa rodada foi: \(points)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Valeu meu patrão!", style: .default, handler: { action in self.startNewRound()})
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        displayTargetValue.text = String(targetValue)
        displayScore.text = String(score)
        displayRound.text = String(round)
    }
}

