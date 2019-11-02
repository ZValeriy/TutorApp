//
//  signUpModel.swift
//  TutorApp
//
//  Created by Valeriy on 02.11.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import Foundation

class SignUpUser {
    private var name: String?
    private var email: String?
    private var isTeacher: Bool?
    private var password: String?
    
    init() {
    }
    
    func setName(with name: String) {
        self.name = name
    }
    
    func getName() -> String? {
        return self.name ?? ""
    }
    
    func setEmail(with email: String) {
        self.email = email
    }
    
    func getEmail() -> String? {
        return self.email ?? ""
    }
    
    func setIsTeacher(with isTeacher: Bool) {
        self.isTeacher = isTeacher
    }
    
    func getIsTeacher() -> Bool? {
        return self.isTeacher ?? false
    }
    
    func setPassword(with password: String) {
        self.password = password
    }
    
    func getPassword() -> String? {
        return self.password ?? ""
    }
    
    
}
