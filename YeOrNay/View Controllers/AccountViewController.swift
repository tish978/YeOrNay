//
//  AccountViewController.swift
//  YeOrNay
//
//  Created by satish bisa on 7/1/21.
//

import UIKit
import AVFoundation

class AccountViewController: UIViewController {

    var videoPlayer: AVPlayer?
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backButtonSegue(_ sender: Any) {
//        print("back button segue triggered!")
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        nextViewController.modalPresentationStyle = .fullScreen
//        self.present(nextViewController, animated:true, completion:nil)
        if let nav = self.navigationController{
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundVideo()
        setUpButtons()
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
    
    func setUpButtons(){
        Utilities.styleFilledButton(loginBtn)
        Utilities.styleHollowButton(signUpBtn)
    }

}
