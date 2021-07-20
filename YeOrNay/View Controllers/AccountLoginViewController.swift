//
//  AccountLoginViewController.swift
//  YeOrNay
//
//  Created by satish bisa on 7/1/21.
//

import UIKit
import AVFoundation

class AccountLoginViewController: UIViewController {
    
    var videoPlayer: AVPlayer?

    @IBOutlet weak var backButton: UIButton!
    
    
    @IBAction func backButtonSegue(_ sender: Any) {
        print("back button segue triggered!")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var logInBtn: UIButton!
 
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundVideo()
        setUpElements()
    }
    
    @objc func playerItemDidReachEnd(){
        videoPlayer!.seek(to: CMTime.zero)
    }
    
    func playBackgroundVideo(){
        let path = Bundle.main.path(forResource: "artem", ofType: "mp4")
        videoPlayer = AVPlayer(url: URL(fileURLWithPath: path!))
        videoPlayer!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: videoPlayer)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: videoPlayer!.currentItem)
        videoPlayer!.seek(to: CMTime.zero)
        videoPlayer!.play()
        self.videoPlayer?.isMuted = true
    }

    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInBtn)
    }


}
