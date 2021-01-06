//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 180, "Medium": 420, "Hard": 720] //in seconds
    var counter = 0;
    var timer = Timer();
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        counter = eggTimes[sender.currentTitle!]!
        resetTimer()
    }
    
    @objc func updateCounter() {
        if counter > 0 {
            print("\(counter) seconds")
            counter -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    func resetTimer(){
        timer.invalidate()
        startTimer()
    }
    
}
