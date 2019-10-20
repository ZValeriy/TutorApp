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

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorder(to: nameField)
        addBorder(to: emailField)
        
        

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
