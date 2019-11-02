//
//  SignUpFirstViewController.swift
//  TutorApp
//
//  Created by Valeriy on 21.10.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import UIKit

func addBorder(to field: UITextField) {
    let border = CALayer()
    let borderWidth = CGFloat(2.0)
    border.borderColor = #colorLiteral(red: 0.1137254902, green: 0.8196078431, blue: 0.631372549, alpha: 1)
    border.frame = CGRect(origin: CGPoint(x: 0,y :field.frame.size.height - borderWidth), size: CGSize(width: field.frame.size.width, height: field.frame.size.height))
    border.borderWidth = borderWidth
    field.layer.addSublayer(border)
    field.layer.masksToBounds = true
}

class SignUpFirstViewController: UIViewController {
    
    var signUpUser = SignUpUser()

    @IBOutlet weak var nameField: UITextField! {
        didSet {
            
        }
    }
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var showNextStepButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorder(to: nameField)
        addBorder(to: emailField)
        
        showNextStepButton.isEnabled = false
        showNextStepButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        

        // Do any additional setup after loading the view.
    }
    @IBAction func nextStepButtonPressed(_ sender: Any) {
        
    }
    @IBAction func nameFieldDidChanged(_ sender: Any) {
        if validateInputs() {
            showNextStepButton.isEnabled = true
            showNextStepButton.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.8196078431, blue: 0.631372549, alpha: 1)
        } else {
            showNextStepButton.isEnabled = false
            showNextStepButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    @IBAction func emailFieldDidChanged(_ sender: Any) {
        if validateInputs() {
            showNextStepButton.isEnabled = true
            showNextStepButton.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.8196078431, blue: 0.631372549, alpha: 1)
        } else {
            showNextStepButton.isEnabled = false
            showNextStepButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SignUpSecondViewController {
            signUpUser.setName(with: nameField.text!)
            signUpUser.setEmail(with: emailField.text!)
            
            vc.signUpUser = signUpUser
        }
    }
    
    func validateInputs() -> Bool {
        var result = false
        
        if Validator().isEmailValid(emailField.text ?? "") && !(nameField.text?.isEmpty ?? true) {
            result = true
        }
        
        return result
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
