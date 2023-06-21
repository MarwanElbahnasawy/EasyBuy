import Foundation

class ValidationUtils {
    
    static func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    static func isValidPassword(password: String) -> Bool {
        let minimumLength = 6
        return password.count >= minimumLength
    }
    
    static func passwordsMatch(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
    static func isValidName(name: String) -> Bool {
        let nameRegex = "^[a-zA-Z]{3,}$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return namePredicate.evaluate(with: name)
    }
    
    static func isValidPhoneNumber(phoneNumber: String) -> Bool {
        let phoneNumberRegex = "^\\+[1-9]\\d{11,}$"
        let phoneNumberPredicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return phoneNumberPredicate.evaluate(with: phoneNumber)
    }
}

