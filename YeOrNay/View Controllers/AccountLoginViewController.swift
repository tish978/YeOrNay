//
//  AccountLoginViewController.swift
//  YeOrNay
//
//  Created by satish bisa on 7/1/21.
//

import UIKit
import AVFoundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class AccountLoginViewController: UIViewController {
    
    var videoPlayer: AVPlayer?
    
    
    

    @IBAction func loginUserSegue(_ sender: Any) {
        let error = validateFields()
        
        if error != nil{
            // there was an error  and something was wrong with fields... show error message
            showError(error!)
        }
        else{
            
            // Create cleaned versions of the data
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            let db = Firestore.firestore()
            let user = Auth.auth().currentUser
            let reference = db.collection("users").whereField("email", isEqualTo: email)
            
            
            reference.getDocuments(){ (querysnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querysnapshot!.documents{
                        let password = document.get("password") as! String
                        if self.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == password{
                            Auth.auth().signIn(withEmail: email, password: password){ (user, error) in
                                if Auth.auth().currentUser != nil{
                                    print("Current user email: \(Auth.auth().currentUser?.email)")
                                    // PERFORM SEGUE
                                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "gameBoardVC") as! gameBoardVC
                                    nextViewController.modalPresentationStyle = .fullScreen
                                    self.present(nextViewController, animated:true, completion:nil)
                                } else {
                                    print("No user signed in")
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
    

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
    
    func validateFields() -> String?{
        
        // check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill in all fields."
        }
        
        // check if password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        if Utilities.isPasswordValid(cleanedPassword) == false{
            // Password isnt secure enough
            return "Please make sure password is at least 8 chars, contains a special char, and a number"
        }
        
        
        return nil
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
     
        let error = validateFields()
        
        if error != nil{
            // there was an error  and something was wrong with fields... show error message
            showError(error!)
        }
        else{
            
            // Create cleaned versions of the data
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            let db = Firestore.firestore()
            let user = Auth.auth().currentUser
            let reference = db.collection("users").whereField("email", isEqualTo: email)
            
            
            reference.getDocuments(){ (querysnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querysnapshot!.documents{
                        let password = document.get("password") as! String
                        if self.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == password{
                            Auth.auth().signIn(withEmail: email, password: password){ (user, error) in
                                if Auth.auth().currentUser != nil{
                                    print("Current user email: \(Auth.auth().currentUser?.email)")
                                } else {
                                    print("No user signed in")
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }



}
