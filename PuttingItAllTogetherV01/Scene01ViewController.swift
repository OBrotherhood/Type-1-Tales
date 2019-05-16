//
//  Scene01ViewController.swift
//  PuttingItAllTogetherV01
//
//  Created by Oliver Brotherhood on 07/04/2019.
//  Copyright © 2019 Oliver Brotherhood. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class Scene01ViewController: UIViewController {
    
    @IBOutlet weak var video01: UIView!
    
    @IBOutlet weak var storyBox: UITextView!
    
    @IBOutlet weak var textBox: UIImageView!
    
    //Creating the timer
    var countdownTimer: Timer!
    var totalTime = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        textBox.isHidden = true
        storyBox.isHidden = true
        //Starting the timer
        startTimer()
        
        storyBox.text = story[currentScenceCheck];
        
    }
    
    private func setupView(){
        //Function used to load and play the video, it additonally measures the duration of the video
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: sceneNames[currentScenceCheck], ofType: "mov")!)
        let player = AVPlayer(url: path)
        let newLayer = AVPlayerLayer(player: player)
        
        newLayer.frame = self.video01.frame
        self.video01.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        player.play()
        totalTime = Int(CMTimeGetSeconds((player.currentItem?.asset.duration)!))-2
    }
    
    func startTimer() {
        //Function used to intiate and start the timer
        print("timer started")
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        //Function used to update the timer ever second
        if totalTime != 0 {
            totalTime -= 1
        } else {
            textBox.isHidden = false
            storyBox.isHidden = false
            print("timer end");
            endTimer()
        }
    }
    
    func endTimer() {
        //Function used to end the timer
        countdownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}
