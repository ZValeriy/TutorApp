//
//  SignUpSecondViewController.swift
//  TutorApp
//
//  Created by Valeriy on 21.10.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import UIKit

class SignUpSecondViewController: UIViewController {
    @IBOutlet weak var nextStepButton: UIButton!
    var signUpUser: SignUpUser?
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rePasswordField: UITextField!
    @IBAction func passwordFieldDidChanged(_ sender: Any) {
        if validateInputs() {
            nextStepButton.isEnabled = true
            nextStepButton.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.8196078431, blue: 0.631372549, alpha: 1)
        } else {
            nextStepButton.isEnabled = false
            nextStepButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    @IBAction func rePasswordFieldDidChanged(_ sender: Any) {
        if validateInputs() {
            nextStepButton.isEnabled = true
            nextStepButton.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.8196078431, blue: 0.631372549, alpha: 1)
        } else {
            nextStepButton.isEnabled = false
            nextStepButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorder(to: rePasswordField)
        addBorder(to: passwordField)
        // Do any additional setup after loading the view.
        
        nextStepButton.isEnabled = false
        nextStepButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SignUpFinalViewController {
            signUpUser?.setPassword(with: passwordField.text!)
            
            vc.signUpUser = signUpUser
        }
    }
    
    func validateInputs() -> Bool {
        var result = false
        
        if passwordField.text == rePasswordField.text && Validator().isPasswordValid(passwordField.text ?? "") {
            result = true
        }
        
        return result
    }

}
