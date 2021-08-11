//
//  LeaderboardVC.swift
//  YeOrNay
//
//  Created by satish bisa on 7/18/21.
//

import UIKit
import SAConfettiView
import ICConfetti
import Firebase
import FirebaseFirestore
import FirebaseAuth

class LeaderboardVC: UIViewController {

    var icConfetti: ICConfetti!
    
    var scoreArray = [String]()
    
    let leaderLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "WORLDWIDE LEADERBOARD"
        lbl.font = UIFont(name: "Aquino-Demo", size: 25)
        lbl.textColor = .orange
        return lbl
    }()
    
    
    let scoreLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "NAME    SCORE"
        lbl.font = UIFont(name: "Aquino-Demo", size: 25)
        return lbl
    }()
    
    
    let textField1: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "INSERT TEXT"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Aquino-Demo", size: 18)
        return lbl
    }()
    
    let scoreField1: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "INSERT TEXT"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Aquino-Demo", size: 18)
        return lbl
    }()
    
    let textField2: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "INSERT TEXT"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Aquino-Demo", size: 18)
        return lbl
    }()
    
    let scoreField2: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "INSERT TEXT"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Aquino-Demo", size: 18)
        return lbl
    }()
    
    
    let textField3: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "INSERT TEXT"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Aquino-Demo", size: 18)
        return lbl
    }()
    
    
    let scoreField3: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "INSERT TEXT"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Aquino-Demo", size: 18)
        return lbl
    }()
    
    
    let textField4: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "INSERT TEXT"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Aquino-Demo", size: 18)
        return lbl
    }()
    
    
    let scoreField4: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "INSERT TEXT"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Aquino-Demo", size: 18)
        return lbl
    }()
    
    
    let yourScoreLbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "YOUR HIGH SCORE:"
        lbl.font = UIFont(name: "Aquino-Demo", size: 25)
        lbl.textColor = .orange
        return lbl
    }()
    
    let yourScore: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "300"
        lbl.font = UIFont(name: "Aquino-Demo", size: 50)
        lbl.textColor = .green
        return lbl
    }()
    
    @IBOutlet weak var backToHome: UIButton!
    
    let db = Firestore.firestore()
    
    //let ref = db.collection("users").whereField("highScore", isGreaterThanOrEqualTo: 0)
    
    @IBAction func backToHome(_ sender: Any) {
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateLeaders()
        icConfetti = ICConfetti()
        icConfetti.rain(in: self.view)
        
        view.addSubview(leaderLabel)
        view.addSubview(scoreLabel)
        view.addSubview(textField1)
        view.addSubview(scoreField1)
        view.addSubview(textField2)
        view.addSubview(scoreField2)
        view.addSubview(textField3)
        view.addSubview(scoreField3)
        view.addSubview(textField4)
        view.addSubview(scoreField4)
        view.addSubview(yourScoreLbl)
        view.addSubview(yourScore)
        
        
        getUserScore()
        
        
        leaderLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        leaderLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        
        scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        scoreLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        
        
        textField1.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        textField1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 125).isActive = true
        
        
        scoreField1.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        scoreField1.leftAnchor.constraint(equalTo: textField1.leftAnchor, constant: 100).isActive = true
        
        
        textField2.topAnchor.constraint(equalTo: view.topAnchor, constant: 225).isActive = true
        textField2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 125).isActive = true
        
        
        scoreField2.topAnchor.constraint(equalTo: view.topAnchor, constant: 225).isActive = true
        scoreField2.leftAnchor.constraint(equalTo: textField2.leftAnchor, constant: 100).isActive = true
        
        
        textField3.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        textField3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 125).isActive = true
        
        
        scoreField3.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        scoreField3.leftAnchor.constraint(equalTo: textField3.leftAnchor, constant: 100).isActive = true
        
        
        textField4.topAnchor.constraint(equalTo: view.topAnchor, constant: 275).isActive = true
        textField4.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 125).isActive = true
        
        
        scoreField4.topAnchor.constraint(equalTo: view.topAnchor, constant: 275).isActive = true
        scoreField4.leftAnchor.constraint(equalTo: textField4.leftAnchor, constant: 100).isActive = true
        
        
        yourScoreLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
        yourScoreLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75).isActive = true
        
        
        yourScore.topAnchor.constraint(equalTo: view.topAnchor, constant: 380).isActive = true
        yourScore.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 165).isActive = true
    }
    

    
    func getUserScore(){
        //let user = Auth.auth().currentUser
        print("Current value of getUserScore emailstring is: \(emailString)")
        let reference = db.collection("users").whereField("email", isEqualTo: emailString)
        
        reference.getDocuments(){ (querysnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querysnapshot!.documents{
                    print("USER'S SCORE IS: \(document.get("highScore"))")
                    self.yourScore.text = " \(document.get("highScore") as! Int)"
                }
            }
        }
    }
    
    
    
    func calculateLeaders(){
        
        var intNum = 1
        
        let ref = db.collection("users").whereField("highScore", isGreaterThan: 0).order(by: "highScore", descending: true).limit(to: 4)
        ref.getDocuments(){ (querysnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querysnapshot!.documents{
                    var stringToAppend = "\(document.get("firstname") as! String)           \(document.get("highScore") as! Int) "
                    var nameToAppend = document.get("firstname") as! String
                    var scoreToAppend = "\(document.get("highScore") as! Int)"
                    self.scoreArray.append(stringToAppend)
                   // print("First Name -> \(document.get("firstname") as! String) || Score -> \(document.get("highScore") as! Int)")
                    //print("Final contents of array: \(self.scoreArray)")
                    
                    if intNum == 1 {
                        self.textField1.text = nameToAppend
                        self.scoreField1.text = scoreToAppend
                        print("current value of intNum: \(intNum) -> \(self.textField1.text)")
                    } else if intNum == 2{
                        self.textField2.text = nameToAppend
                        self.scoreField2.text = scoreToAppend
                        print("current value of intNum: \(intNum) -> \(self.textField2.text)")
                    } else if intNum == 3 {
                        self.textField3.text = nameToAppend
                        self.scoreField3.text = scoreToAppend
                        print("current value of intNum: \(intNum) -> \(self.textField3.text)")
                    } else {
                        self.textField4.text = nameToAppend
                        self.scoreField4.text = scoreToAppend
                        print("current value of intNum: \(intNum) -> \(self.textField4.text)")
                    }
                    
                    intNum += 1
                    
                }
            }
        }

    }

}
