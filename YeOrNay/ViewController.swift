//
//  ViewController.swift
//  YeOrNay
//
//  Created by satish bisa on 5/26/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
        // Do any additional setup after loading the view.
    }

    func playMusic(){
            if let player = player, player.isPlaying{
                // stop playback
            } else {
                // setup player and play
                let urlString = Bundle.main.path(forResource: "stretchMyHands", ofType: "mp3")
                
                do {
                    try AVAudioSession.sharedInstance().setMode(.default)
                    try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                    
                    guard let urlString = urlString else{
                        return
                    }
                    
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                    
                    guard let player = player else{
                        return
                    }
                    
                    player.play()
                
                } catch {
                    print("something went wrong")
                }
            }
            
            print("Attempting to animate stroke")
        }

}

