//
//  ViewController.swift
//  TutorApp
//
//  Created by Valeriy on 05.10.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    var ref: DatabaseReference!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let user = Auth.auth().currentUser
//        var isTeacher = false
//        if let user = user {
//
//            ref = Database.database().reference()
//            ref.child("users").child(user.uid).observeSingleEvent(of: .value, with: { (snapshot) in
//              let value = snapshot.value as? NSDictionary
//              isTeacher = value?["isTeacher"] as? Bool ?? false
//                if isTeacher {
//                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                    let tutorMainViewController = storyBoard.instantiateViewController(withIdentifier: "tutorMain") as! TutorMainViewController
//                    tutorMainViewController.modalPresentationStyle = .fullScreen
//                    self.present(tutorMainViewController, animated: true, completion: nil)
//                } else {
//                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                    let studentMainViewController = storyBoard.instantiateViewController(withIdentifier: "studentMain") as! StudentMainViewController
//                    studentMainViewController.modalPresentationStyle = .fullScreen
//                    self.present(studentMainViewController, animated: true, completion: nil)
//                }
//              }) { (error) in
//                print(error.localizedDescription)
//            }
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImage.layer.cornerRadius = logoImage.frame.size.width/2
        logoImage.layer.masksToBounds = true
        logoImage.layer.borderWidth = 3
        logoImage.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
    }


}

