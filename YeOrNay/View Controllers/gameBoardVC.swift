//
//  gameBoardVC.swift
//  YeOrNay
//
//  Created by satish bisa on 5/31/21.
//
import UIKit
import Foundation
import LoremSwiftum
import BlaBlaBla
import AVFoundation

class gameBoardVC: UIViewController {

    var player: AVAudioPlayer?
    var videoPlayer: AVPlayer?
    
    var newString: String?
    var score: Int = 0
    var toBeReturned: String = ""
    var isYe: Bool = false
    var isNotYe: Bool = false
    var decidingQuotes: [String] = ["", ""]
    var kanyeQuotes: [String] = ["2024",
                                 "All you have to be is yourself",
                                 "Believe in your flyness...conquer your shyness.",
                                 "Burn that excel spread sheet",
                                 "Decentralize",
                                 "Distraction is the enemy of vision",
                                 "Everything you do in life stems from either fear or love",
                                 "For me giving up is way harder than trying.",
                                 "For me, money is not my definition of success. Inspiring people is a definition of success",
                                 "Fur pillows are hard to actually sleep on",
                                 "George Bush doesn't care about black people",
                                 "Have you ever thought you were in love with someone but then realized you were just staring in a mirror for 20 minutes?",
                                 "I care. I care about everything. Sometimes not giving a f#%k is caring the most.",
                                 "I feel calm but energized",
                                 "I feel like I'm too busy writing history to read it.",
                                 "I feel like me and Taylor might still have sex",
                                 "I give up drinking every week",
                                 "I leave my emojis bart Simpson color",
                                 "I love sleep; it's my favorite.",
                                 "I make awesome decisions in bike stores!!!",
                                 "I really love my Tesla. I'm in the future. Thank you Elon.",
                                 "I still think I am the greatest.",
                                 "I think I do myself a disservice by comparing myself to Steve Jobs and Walt Disney and human beings that we've seen before. It should be more like Willy Wonka...and welcome to my chocolate factory.",
                                 "I want the world to be better! All I want is positive! All I want is dopeness!",
                                 "I wish I had a friend like me",
                                 "I'd like to meet with Tim Cook. I got some ideas",
                                 "I'll say things that are serious and put them in a joke form so people can enjoy them. We laugh to keep from crying.",
                                 "I'm a creative genius",
                                 "I'm nice at ping pong",
                                 "I'm the best",
                                 "If I don't scream, if I don't say something then no one's going to say anything.",
                                 "If I got any cooler I would freeze to death",
                                 "Just stop lying about shit. Just stop lying.",
                                 "Keep squares out yo circle",
                                 "Keep your nose out the sky, keep your heart to god, and keep your face to the rising sun.",
                                 "Let's be like water",
                                 "Man... whatever happened to my antique fish tank?",
                                 "My dad got me a drone for Christmas",
                                 "My greatest award is what I'm about to do.",
                                 "My greatest pain in life is that I will never be able to see myself perform live.",
                                 "One day I'm gon' marry a porn star",
                                 "One of my favorite of many things about what the Trump hat represents to me is that people can't tell me what to do because I'm black",
                                 "Only free thinkers",
                                 "People always say that you can't please everybody. I think that's a cop-out. Why not attempt it? Cause think of all the people that you will please if you try.",
                                 "People always tell you 'Be humble. Be humble.' When was the last time someone told you to be amazing? Be great! Be awesome! Be awesome!",
                                 "People only get jealous when they care.",
                                 "Perhaps I should have been more like water today",
                                 "Pulling up in the may bike",
                                 "Shut the fuck up I will fucking laser you with alien fucking eyes and explode your fucking head",
                                 "Sometimes I push the door close button on people running towards the elevator. I just need my own elevator sometimes. My sanctuary.",
                                 "Sometimes you have to get rid of everything",
                                 "Style is genderless",
                                 "The thought police want to suppress freedom of thought",
                                 "The world is our family",
                                 "The world is our office",
                                 "Today is the best day ever and tomorrow's going to be even better",
                                 "Truth is my goal. Controversy is my gym. I'll do a hundred reps of controversy for a 6 pack of truth",
                                 "Tweeting is legal and also therapeutic",
                                 "We all self-conscious. I'm just the first to admit it.",
                                 "We came into a broken world. And we're the cleanup crew.",
                                 "You can't look at a glass half full or empty if it's overflowing.",
                                 "I hate when I'm on a flight and I wake up with a water bottle next to me like oh great now I gotta be responsible for this water bottle",
                                 "All the musicians will be free",
                                 "Artists are founders",
                                 "Buy property",
                                 "Culture is the most powerful force in humanity under God",
                                 "Empathy is the glue",
                                 "I am one of the most famous people on the planet",
                                 "I am running for President of the United States",
                                 "I am the head of Adidas. I will bring Adidas and Puma back together and bring me and jay back together",
                                 "I channel Will Ferrell when I'm at the daddy daughter dances",
                                 "I don't wanna see no woke tweets or hear no woke raps ... it's show time ... it's a whole different energy right now",
                                 "I hear people say this person is cool and this person is not cool. People are cool. Man has never invented anything as awesome as a an actual person but sometimes we value the objects we create over life itself",
                                 "I honestly need all my Royeres to be museum quality... if I see a fake Royere Ima have to Rick James your couch",
                                 "I love UZI. I be saying the same thing about Steve Jobs. I be feeling just like UZI",
                                 "I need an army of angels to cover me while I pull this sword out of the stone",
                                 "I spoke to Dave Chapelle for two hours this morning. He is our modern day Socrates",
                                 "I was just speaking with someone that told me their life story and they used to be homeless.",
                                 "I watch Bladerunner on repeat",
                                 "I'm giving all Good music artists back the 50% share I have of their masters",
                                 "I'm going to personally see to it that Taylor Swift gets her masters back. Scooter is a close family friend",
                                 "I'm the new Moses",
                                 "Life is the ultimate gift",
                                 "Ma$e is one of my favorite rappers and I based a lot of my flows off of him",
                                 "Manga all day",
                                 "My first pillar when I'm on the board of adidas will be an adidas Nike collaboration to support community growth",
                                 "My mama was a' English teacher. I know how to use correct English but sometimes I just don't feel like it aaaand I ain't got to",
                                 "My memories are from the future",
                                 "My mother in law Kris Jenner ... makes the best music playlist",
                                 "People say it's enough and I got my point across ... the point isn't across until we cross the point",
                                 "People tried to talk me out of running for President. Never let weak controlling people kill your spirit",
                                 "So many of us need so much less than we have especially when so many of us are in need",
                                 "Speak God's truth to power",
                                 "The media tries to kill our heroes one at a time",
                                 "The world needs more Joy... this idea is super fresh",
                                 "There are 5 main pillars in a professional musicians business - Recording, Publishing, Touring, Merchandise & Name and likeness",
                                 "There are people sleeping in parking lots",
                                 "There's a crying need for civility across the board. We need to and will come together in the name of Jesus.",
                                 "There's so many lonely emojis man",
                                 "Trust me ... I won't stop",
                                 "Two years ago we had 50 million people subscribed to music streaming services around the world. Today we have 400 million.",
                                 "We are here to complete the revolution. We are building the future",
                                 "We as a people will heal. We will insure the well being of each other",
                                 "We have to evolve",
                                 "We must and will cure homelessness and hunger. We have the capability as a species",
                                 "We must form a union. We must unify",
                                 "We used to diss Michael Jackson the media made us call him crazy ... then they killed him",
                                 "We will be recognized",
                                 "We will change the paradigm",
                                 "We will cure hunger",
                                 "We will heal. We will cure.",
                                 "We're going to move the entire music industry into the 21st Century",
                                 "We've gotten comfortable with not having what we deserve",
                                 "Who made up the term major label in the first place???",
                                 "Winning is the only option"
    ]
    
    let cardOne: UIButton = {
        let v = UIButton(frame: CGRect(x: 0, y: 100, width: 400, height: 250))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.25)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let cardOneLbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 350, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.center = CGPoint(x: 300, y: 285)
        lbl.textAlignment = .center
        lbl.text = "EMPTY TEXT"
        lbl.font = UIFont(name: "Aquino-Demo", size: 12)
        lbl.numberOfLines = 6
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        return lbl
    }()
    
    let cardTwoLbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.center = CGPoint(x: 300, y: 285)
        lbl.textAlignment = .center
        lbl.text = "NEXT QUESTION"
        lbl.font = UIFont(name: "Aquino-Demo", size: 12)
        lbl.numberOfLines = 6
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        lbl.isHidden = true
        return lbl
    }()
    
    let cardTwo: UIButton = {
        let v = UIButton(frame: CGRect(x: 0, y: 100, width: 350, height: 250))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.25)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = true
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let cardThreeLbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.center = CGPoint(x: 300, y: 285)
        lbl.textAlignment = .center
        lbl.text = "GAME OVER! \n Press to Restart"
        lbl.font = UIFont(name: "Aquino-Demo", size: 12)
        lbl.numberOfLines = 6
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        lbl.isHidden = true
        return lbl
    }()
    
    let cardThree: UIButton = {
        let v = UIButton(frame: CGRect(x: 0, y: 100, width: 350, height: 250))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.red.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.25)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = true
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let yeButton: UIButton = {
        let v = UIButton(frame: CGRect(x: 0, y: 100, width: 160, height: 150))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.green.cgColor, UIColor.yellow.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.25)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let yeLbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.center = CGPoint(x: 300, y: 285)
        lbl.textAlignment = .center
        lbl.text = "YE"
        lbl.font = UIFont(name: "Aquino-Demo", size: 25)
        lbl.numberOfLines = 6
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        return lbl
    }()
    
    let nayButton: UIButton = {
        let v = UIButton(frame: CGRect(x: 0, y: 100, width: 160, height: 150))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.25)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let nayLbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.center = CGPoint(x: 300, y: 285)
        lbl.textAlignment = .center
        lbl.text = "NAY"
        lbl.font = UIFont(name: "Aquino-Demo", size: 25)
        lbl.numberOfLines = 6
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return lbl
    }()
    
    let scoreLbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 75, y: 100, width: 275, height: 200))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.center = CGPoint(x: 300, y: 285)
        lbl.textAlignment = .center
        lbl.text = "SCORE"
        lbl.font = UIFont(name: "Aquino-Demo", size: 25)
        lbl.numberOfLines = 6
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playBackgroundVideo()
        
        printQuote(label: cardOneLbl)
        
        
        cardOne.addTarget(self, action: #selector(cardOneFlip), for: .touchUpInside)
        cardTwo.addTarget(self, action: #selector(cardTwoFlip), for: .touchUpInside)
        cardThree.addTarget(self, action: #selector(cardThreeFlip), for: .touchUpInside)
        view.addSubview(cardOne)
        
        view.addSubview(cardOneLbl)
        
        view.addSubview(yeButton)
        view.addSubview(nayButton)
        view.addSubview(yeLbl)
        view.addSubview(nayLbl)
        view.addSubview(scoreLbl)
        yeButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        nayButton.addTarget(self, action: #selector(checkAnswer2), for: .touchUpInside)
        
        
        
        cardOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        cardOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        cardOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        cardOne.heightAnchor.constraint(equalToConstant: 250).isActive = true
        cardOne.widthAnchor.constraint(equalToConstant: 325).isActive = true
        
        
        cardOneLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        cardOneLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        cardOneLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
//        cardOneLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        cardOneLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cardOneLbl.heightAnchor.constraint(equalToConstant: 250).isActive = true
        cardOneLbl.widthAnchor.constraint(equalToConstant: 325).isActive = true
        
        
        yeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        yeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        yeButton.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 175).isActive = true
        yeButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        yeButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        yeLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        yeLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        yeLbl.heightAnchor.constraint(equalToConstant: 120).isActive = true
        yeLbl.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        nayButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        //nayButton.leftAnchor.constraint(equalTo: yeButton.rightAnchor, constant: 50).isActive = true
        nayButton.leftAnchor.constraint(equalTo: view.rightAnchor, constant: -175).isActive = true
        nayButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        nayButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        nayButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        nayLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        nayLbl.leftAnchor.constraint(equalTo: nayButton.leftAnchor, constant: 0).isActive = true
        //nayLbl.leftAnchor.constraint(equalTo: nayButton.l, constant: -5).isActive = true
        nayLbl.heightAnchor.constraint(equalToConstant: 120).isActive = true
        nayLbl.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        scoreLbl.topAnchor.constraint(equalTo: yeButton.topAnchor, constant: 150).isActive = true
        //scoreLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 125).isActive = true
        //scoreLbl.leftAnchor.constraint(equalTo: yeButton.rightAnchor, constant: -50).isActive = true
        scoreLbl.leftAnchor.constraint(equalTo: yeButton.rightAnchor, constant: -45).isActive = true
        scoreLbl.rightAnchor.constraint(equalTo: nayButton.leftAnchor, constant: 40).isActive = true
        scoreLbl.heightAnchor.constraint(equalToConstant: 120).isActive = true
        scoreLbl.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        view.addSubview(cardTwo)
        view.addSubview(cardTwoLbl)
        view.addSubview(cardThree)
        view.addSubview(cardThreeLbl)
        
        cardTwo.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        cardTwo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        cardTwo.heightAnchor.constraint(equalToConstant: 250).isActive = true
        cardTwo.widthAnchor.constraint(equalToConstant: 350).isActive = true

        cardTwoLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        cardTwoLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        cardTwoLbl.heightAnchor.constraint(equalToConstant: 250).isActive = true
        cardTwoLbl.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        cardThree.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        cardThree.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        cardThree.heightAnchor.constraint(equalToConstant: 250).isActive = true
        cardThree.widthAnchor.constraint(equalToConstant: 350).isActive = true

        cardThreeLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        cardThreeLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        cardThreeLbl.heightAnchor.constraint(equalToConstant: 250).isActive = true
        cardThreeLbl.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        updateScore(lbl: scoreLbl)
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
    
    @objc private func checkAnswer(){
        if isYe == true{
            score += 10
            scoreLbl.text = "SCORE: \(score)"
            cardTwoLbl.isHidden = false
            cardTwo.isHidden = false
            isNotYe = false
        } else {
            if score > 0 {
                score = 0
                scoreLbl.text = "SCORE: \(score)"
            }
            isNotYe = true
            print("INCORRECT ANSWER")
            //scoreLbl.text = "INCORRECT"
            cardThree.isHidden = false
            cardThreeLbl.isHidden = false
        }
    }
    
    @objc private func checkAnswer2(){
        if isYe == false{
            score += 10
            scoreLbl.text = "SCORE: \(score)"
            cardTwo.isHidden = false
            cardTwoLbl.isHidden = false
            //isNotYe = true
        } else {
            if score > 0 {
                score = 0
                scoreLbl.text = "SCORE: \(score)"
            }
            print("INCORRECT ANSWER")
            //scoreLbl.text = "INCORRECT"
            cardThree.isHidden = false
            cardThreeLbl.isHidden = false
        }
    }
    
    func updateScore(lbl: UILabel){
        lbl.font = UIFont(name: "Aquino-Demo", size: 25)
        lbl.text = "SCORE: \(score)"
    }
    
    func generateRandomQuote(){//){
        //var toBeReturned: String = ""
        
        let url = URL(string: "https://api.quotable.io/random")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, reponse, error in
 
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            var result: MyResult?
            do{
                result = try JSONDecoder().decode(MyResult.self, from: data)
            } catch {
                print("failed to convert \(error.localizedDescription)")
            }

            guard let json = result else {
                return
            }

            //print(json.content)
           // print("Quote to be sent: \(result?.content)")
            self.toBeReturned = (result?.content as String?)!
            print("Quote to be sent: \(self.toBeReturned)")
            self.decidingQuotes[1] = self.toBeReturned
            
            //label.text = self.toBeReturned
            
            //self.setText(label: self.cardTwoLbl, text: result!.content)
            
        })
    
        task.resume()
        
    }
    
    func setText(label: UILabel, text: String){
        label.text = text
        print("Just set \(text) as the text value for \(label)")
    }
    
    func printQuote(label: UILabel){
        var element: String = kanyeQuotes.randomElement()!
        print("Selected Kanye quote to be printed: \(element)")
        decidingQuotes[0] = element
        
        //isYe = true
        generateRandomQuote()
        print("Value of decidingQuotes[0] is: \(decidingQuotes[0])")
        print("Value of decidingQuotes[1] is: \(decidingQuotes[1])")
        
        label.text = decidingQuotes.randomElement()
        if label.text == decidingQuotes[0] {
            isYe = true
        } else {
            isYe = false
        }
        
        print("Ultimate quote of label is: \(label.text)")
        
        print("decidingQuotes count is: \(decidingQuotes.count)")
    }
    
    @objc private func cardOneFlip(){
        print("cardFlipped!")
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemYellow.cgColor, UIColor.systemPurple.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.25)
        gradient.frame = cardOne.bounds
        cardOne.layer.addSublayer(gradient)
    }

    @objc private func cardTwoFlip(){
        print("cardFlipped!")
        if isYe == true {
            //score = 0
//            if score > 0{
//                score = 0
//            }
            scoreLbl.text = "SCORE: \(score)"
        }
        printQuote(label: cardOneLbl)
        cardTwo.isHidden = true
        cardTwoLbl.isHidden = true
    }
    
    
    @objc private func cardThreeFlip(){
        print("cardFlipped!")
        printQuote(label: cardOneLbl)
        cardThree.isHidden = true
        cardThreeLbl.isHidden = true
        scoreLbl.text = "0"
        scoreLbl.text = "SCORE: \(score)"
    }
}

struct MyResult: Codable{
    let _id: String
    let tags: [String]
    let content: String
    let author: String
    let authorSlug: String
    let length: Int
}
