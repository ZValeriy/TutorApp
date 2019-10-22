//
//  TutorMainViewController.swift
//  TutorApp
//
//  Created by Valeriy on 22.10.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import UIKit
import Firebase

class TutorMainViewController: UIViewController {
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var quitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        profileImage.clipsToBounds = true
        
        profileView.layer.cornerRadius = 10
        profileView.clipsToBounds = true
        profileView.layer.shadowPath = UIBezierPath(roundedRect: profileView.bounds, cornerRadius: profileView.layer.cornerRadius).cgPath
        profileView.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        profileView.layer.shadowOpacity = 0.5
        profileView.layer.shadowOffset = CGSize(width: 5, height: 5)
        profileView.layer.shadowRadius = 5
        profileView.layer.masksToBounds = false
    }
    
    @IBAction func quitApp(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
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