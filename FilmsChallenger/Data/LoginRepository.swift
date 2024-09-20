//
//  LoginRepository.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

protocol LoginRepositoryProtocol {
    func validateLogin(username: String, password: String) -> Bool
}

class LoginRepository: LoginRepositoryProtocol {
    private let validateLoginUseCase = ValidateLoginUseCase()
    
    func validateLogin(username: String, password: String) -> Bool {
        return validateLoginUseCase.execute(username: username, password: password)
    }
}
