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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var constraintContentHeight: NSLayoutConstraint!
    
    var activeField: UITextField?
    var lastOffset: CGPoint!
    var keyboardHeight: CGFloat!
    var ref: DatabaseReference!
    
    @IBAction func dismissKeyboardOnLogin(_ sender: Any) {
        loginField.resignFirstResponder()
    }
    
    @IBAction func dismissKeyboardOnPassword(_ sender: Any) {
        passwordField.resignFirstResponder()
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        loginField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginField.delegate = self
        passwordField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(SignInViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignInViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
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
                
                var isTeacher = false
                if let user = authResult?.user {
                    let userID = user.uid
                    
                    self?.ref = Database.database().reference()
                    self?.ref.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                      let value = snapshot.value as? NSDictionary
                      isTeacher = value?["isTeacher"] as? Bool ?? false
                        if isTeacher {
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let tutorMainViewController = storyBoard.instantiateViewController(withIdentifier: "tutorMain") as! TutorMainViewController
                            tutorMainViewController.modalPresentationStyle = .fullScreen
                            self?.present(tutorMainViewController, animated: true, completion: nil)
                        } else {
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let studentMainViewController = storyBoard.instantiateViewController(withIdentifier: "studentMain") as! StudentMainViewController
                            studentMainViewController.modalPresentationStyle = .fullScreen
                            self?.present(studentMainViewController, animated: true, completion: nil)
                        }
                      }) { (error) in
                        print(error.localizedDescription)
                    }
                }
                
                
            }
        }
    }
    
    @IBAction func loginChanging(_ sender: Any) {
    }
    @IBAction func passwordChanging(_ sender: Any) {
    }
    
    func returnTextView(gesture: UIGestureRecognizer) {
        guard activeField != nil else {
            return
        }
        
        activeField?.resignFirstResponder()
        activeField = nil
    }


}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        lastOffset = self.scrollView.contentOffset
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activeField?.resignFirstResponder()
        activeField = nil
        return true
    }
}

// MARK: Keyboard Handling
extension SignInViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if keyboardHeight != nil {
            return
        }
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = keyboardSize.height
            
            // so increase contentView's height by keyboard height
            UIView.animate(withDuration: 0.1, animations: {
                self.constraintContentHeight.constant += self.keyboardHeight
            })
            
            // move if keyboard hide input field
            let distanceToBottom = self.scrollView.frame.size.height - (activeField?.frame.origin.y)! - (activeField?.frame.size.height)!
            let collapseSpace = keyboardHeight - distanceToBottom
            
            if collapseSpace < 0 {
                // no collapse
                return
            }
            
            // set new offset for scroll view
            UIView.animate(withDuration: 0.3, animations: {
                // scroll to the position above keyboard 10 points
                self.scrollView.contentOffset = CGPoint(x: self.lastOffset.x, y: collapseSpace + 10)
            })
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.constraintContentHeight.constant -= self.keyboardHeight
            
            self.scrollView.contentOffset = self.lastOffset
        }
        
        keyboardHeight = nil
    }
}
