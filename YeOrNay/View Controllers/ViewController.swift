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
    
    let continueBtn: UIButton = {
        let v = UIButton(frame: CGRect(x: 0, y: 100, width: 320, height: 200))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.systemPurple.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 40
        v.isHidden = false
        v.isUserInteractionEnabled = true
        //v.addTarget(self, action: #selector(segueToBoard), for: .touchUpInside)
        return v
    }()
    
    let continueBtnLbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 320, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.center = CGPoint(x: 300, y: 285)
        lbl.textAlignment = .center
        lbl.text = "CONTINUE"
        lbl.font = UIFont(name: "Aquino-Demo", size: 25)
        lbl.textColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
        
        continueBtn.addTarget(self, action: #selector(segueToBoard), for: .touchUpInside)
        view.addSubview(continueBtn)
        continueBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        continueBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 110).isActive = true
        continueBtn.heightAnchor.constraint(equalToConstant: 75).isActive = true
        continueBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(continueBtnLbl)
        
        continueBtnLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        continueBtnLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 110).isActive = true
        continueBtnLbl.heightAnchor.constraint(equalToConstant: 75).isActive = true
        continueBtnLbl.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

    @objc private func segueToBoard(){
        print("Performing segue!")
       // self.performSegue(withIdentifier: "TMBoard", sender: nil)
        //player?.stop()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
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
                    
                   // player.play()
                
                } catch {
                    print("something went wrong")
                }
            }
            
            print("Attempting to animate stroke")
        }

}

