//
//  LoginViewModel.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//
import Foundation

class LoginViewModel {
    private let loginRepository: LoginRepositoryProtocol
        
    init(loginRepository: LoginRepositoryProtocol = LoginRepository()) {
        self.loginRepository = loginRepository
    }
    
    func loginWithUser(_ username: String, password: String) -> Bool {
        let isLogIn = loginRepository.loginWithUser(username, password: password)
        if !isLogIn {
            print("Log In Failed")
        }
        return isLogIn
    }
}
