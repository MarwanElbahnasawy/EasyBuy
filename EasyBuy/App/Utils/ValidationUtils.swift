//
//  ValidationUtils.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 12/06/2023.
//

import Foundation

class ValidationUtils {
    // Validates whether an email address is in a valid format
    // Example: "john@example.com" is valid, "john" is invalid
    static func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // Validates whether a password is at least 6 characters long and contains at least one uppercase letter, one lowercase letter, and one number
    // Example: "Abc123" is valid, "abc" is invalid
    static func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    // Validates whether two passwords match
    // Example: "Abc123" and "Abc123" match, "Abc123" and "123Abc" don't match
    static func passwordsMatch(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
    // Validates whether a name only contains letters and spaces, hyphens, apostrophes, commas, and periods and has a minimum length of 3 characters
    // Example: "John Doe" is valid, "Jo" and "John123" are invalid
    static func isValidName(name: String) -> Bool {
        let nameRegex = "^[a-zA-Z]{3,}+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return namePredicate.evaluate(with: name)
    }
    
    // Validates whether a phone number is formatted using the E.164 standard and contains at least 12 digits after the plus sign
    // Example: "+1613555111122" is valid, "+1613555111" and "1234567890" are invalid
    static func isValidPhoneNumber(phoneNumber: String) -> Bool {
        let phoneNumberRegex = "^\\+[1-9]\\d{11,}$"
        let phoneNumberPredicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return phoneNumberPredicate.evaluate(with: phoneNumber)
    }
}

