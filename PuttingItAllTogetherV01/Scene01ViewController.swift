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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        storyBox.text = story[currentScenceCheck];
        
    }
    
    private func setupView(){
        
        //Check what the current page number is, if its 1 load the first scene, if its 2 load the second, if its 3 the third, etc.
        
        //How to add the video video - https://www.youtube.com/watch?v=8hs9coLSFOQ
        
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: sceneNames[currentScenceCheck], ofType: "mov")!)
        
        let player = AVPlayer(url: path)
        
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.video01.frame
        self.video01.layer.addSublayer(newLayer )
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        player.play()
        
        
    }
    
    func obVideoPlayer(videoName: String, videoType: String){
        
        
        
    }
    
}
