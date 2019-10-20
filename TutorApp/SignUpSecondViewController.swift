//
//  SignUpSecondViewController.swift
//  TutorApp
//
//  Created by Valeriy on 21.10.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import UIKit

class SignUpSecondViewController: UIViewController {
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rePasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorder(to: rePasswordField)
        addBorder(to: passwordField)
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
