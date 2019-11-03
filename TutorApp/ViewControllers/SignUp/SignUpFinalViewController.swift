//
//  SignUpFinalViewController.swift
//  TutorApp
//
//  Created by Valeriy on 21.10.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import UIKit
import Firebase


class SignUpFinalViewController: UIViewController {

    var signUpUser: SignUpUser?
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.stopAnimating()
        ref = Database.database().reference()

        let font = UIFont.systemFont(ofSize: 20)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        
    
    }
    @IBAction func signUp(_ sender: Any) {
        var isTeacher = false
        if segmentedControl.selectedSegmentIndex == 0 {
            isTeacher = true
        }
        
        signUpUser?.setIsTeacher(with: isTeacher)
        
        activityIndicator.startAnimating()
        Auth.auth().createUser(withEmail: (signUpUser?.getEmail()!)!, password: (signUpUser?.getPassword()!)!) { authResult, error in
            
            if error != nil {
                print(error ?? "ОШИБКА РЕГИСТРАЦИИ")
            } else {
                guard self != nil else { return }
                
                self.activityIndicator.stopAnimating()
                let user = Auth.auth().currentUser
                if let user = user {
                    let uid = user.uid
                
                    self.ref.child("users").child(uid).setValue(["isTeacher": self.signUpUser?.getIsTeacher()])
                }
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = self.signUpUser?.getName()
                changeRequest?.commitChanges { (error) in
                  // ...
                }
                
                
                
                if (self.signUpUser?.getIsTeacher())! {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let tutorMainViewController = storyBoard.instantiateViewController(withIdentifier: "tutorMain") as! TutorMainViewController
                    self.activityIndicator.stopAnimating()
                    tutorMainViewController.modalPresentationStyle = .fullScreen
                    self.present(tutorMainViewController, animated: true, completion: nil)
                } else {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let studentMainViewController = storyBoard.instantiateViewController(withIdentifier: "studentMain") as! StudentMainViewController
                    self.activityIndicator.stopAnimating()
                    studentMainViewController.modalPresentationStyle = .fullScreen
                    self.present(studentMainViewController, animated: true, completion: nil)
                }

                
            }
            
            
        }
        
    }

}
