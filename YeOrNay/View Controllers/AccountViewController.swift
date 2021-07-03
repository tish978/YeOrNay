//
//  AccountViewController.swift
//  YeOrNay
//
//  Created by satish bisa on 7/1/21.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
    }
    
    func setUpButtons(){
        Utilities.styleFilledButton(loginBtn)
        Utilities.styleHollowButton(signUpBtn)
    }

}
