//
//  LeaderboardVC.swift
//  YeOrNay
//
//  Created by satish bisa on 7/18/21.
//

import UIKit
import SAConfettiView
import ICConfetti

class LeaderboardVC: UIViewController {

    var icConfetti: ICConfetti!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        icConfetti = ICConfetti()
        icConfetti.rain(in: self.view)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
