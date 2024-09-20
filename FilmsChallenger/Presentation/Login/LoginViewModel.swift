//
//  LoginViewModel.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//
import Foundation

class LoginViewModel {
    private let loginRepository: LoginRepositoryProtocol
    
    var errorMessage: String?
    
    init(loginRepository: LoginRepositoryProtocol = LoginRepository()) {
        self.loginRepository = loginRepository
    }
    
    func validateCredentials(username: String, password: String) -> Bool {
        let isValid = loginRepository.validateLogin(username: username, password: password)
        if !isValid {
            errorMessage = "Upps!! Usuario o contraseña incorrectos."
        }
        return isValid
    }
}
