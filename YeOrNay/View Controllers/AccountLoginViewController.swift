//
//  AccountLoginViewController.swift
//  YeOrNay
//
//  Created by satish bisa on 7/1/21.
//

import UIKit

class AccountLoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var logInBtn: UIButton!
 
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    

    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInBtn)
    }


}
