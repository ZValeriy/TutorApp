//
//  StudentTableProfile.swift
//  TutorApp
//
//  Created by Valeriy on 21.11.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import Foundation

class StudentTable {
    var name: String
    var profileImageUrl: String
    
    init(studentName: String, profileImage: String) {
        self.name = studentName
        self.profileImageUrl = profileImage
    }
}
