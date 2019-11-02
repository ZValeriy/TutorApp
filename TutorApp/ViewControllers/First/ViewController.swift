//
//  ViewController.swift
//  TutorApp
//
//  Created by Valeriy on 05.10.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImage.layer.cornerRadius = logoImage.frame.size.width/2
        logoImage.layer.masksToBounds = true
        logoImage.layer.borderWidth = 3
        logoImage.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
    }


}

