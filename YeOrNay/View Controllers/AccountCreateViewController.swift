//
//  AccountCreateViewController.swift
//  YeOrNay
//
//  Created by satish bisa on 7/1/21.
//

import UIKit
import AVFoundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class AccountCreateViewController: UIViewController {
    
    var videoPlayer: AVPlayer?

    
    
    @IBAction func backButtonSegue(_ sender: Any) {
        print("back button segue triggered!")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signUpButtion: UIButton!
    
    
    
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
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButtion)
    }
    
    func validateFields() -> String?{
        
        // check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
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
        print("1")
        //Validate the fields
        let error = validateFields()
        
        if error != nil{
            // there was an error  and something was wrong with fields... show error message
            showError(error!)
        }
        else{
            
            // Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                print("2")
                
                // check for errors
                if err != nil{
                    //there was an error creating user
                    self.showError("error making user")
                    print(err)
                } else{
                    // User was created succesfully, now store the first and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid":result!.user.uid, "highScore":0]) { (error) in
                        
                        if error != nil{
                            self.showError("User data couldn't be saved")
                        }
                        
                    }
                    print("3")
                    // Transtition to home screen
                    self.transitionToHome()
                    
                }
                
            }
            // Transition to the home screen
            
        }
        
        
    }
    
 
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        print("4")
        let homeViewController =   storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? gameBoardVC
        print("5")
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        print("6")
    }
    
}
