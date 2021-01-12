//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 10, "Medium": 420, "Hard": 720] //in seconds
    var player: AVAudioPlayer!
    var totalSeconds : Float = 0;
    var secondsPassed : Float = 0;
    var timer = Timer();
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        totalSeconds = Float(eggTimes[sender.currentTitle!]!)
        secondsPassed = 0
        timerProgress.progress = 0
        titleLabel.text = sender.currentTitle!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalSeconds {
            secondsPassed += 1
            let percentageProgress = secondsPassed/totalSeconds
            timerProgress.progress = percentageProgress
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
