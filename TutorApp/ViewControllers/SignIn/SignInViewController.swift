//
//  SignInViewController.swift
//  TutorApp
//
//  Created by Valeriy on 20.10.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorder(to: loginField)
        addBorder(to: passwordField)
        activityIndicator.stopAnimating()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: UIButton) {
        activityIndicator.startAnimating()

        Auth.auth().signIn(withEmail: loginField.text!, password: passwordField.text!) { [weak self] authResult, error in
            if error != nil {
                print(error ?? "Ошибка")
                
            } else {
                guard self != nil else { return }
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let tutorMainViewController = storyBoard.instantiateViewController(withIdentifier: "tutorMain") as! TutorMainViewController
                self?.activityIndicator.stopAnimating()
                tutorMainViewController.modalPresentationStyle = .fullScreen
                self?.present(tutorMainViewController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func loginChanging(_ sender: Any) {
    }
    @IBAction func passwordChanging(_ sender: Any) {
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