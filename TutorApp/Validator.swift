//
//  Validator.swift
//  TutorApp
//
//  Created by Valeriy on 02.11.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import Foundation


class Validator {
    func isEmailValid(_ value: String) -> Bool {
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                return false
            }
        } catch {
            return false
        }
        return true
    }
    
    func isPasswordValid(_ value: String) -> Bool {
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]{4,10}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                return false
            }
        } catch {
            return false
        }
        return true
    }
}
