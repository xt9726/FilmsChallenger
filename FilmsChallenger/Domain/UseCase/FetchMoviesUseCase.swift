//
//  FetchMoviesUseCase.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

class FetchMoviesUseCase {
    private let repository: MovieRepositoryProtocol
    
    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.fetchMovies(page: page, completion: completion)
    }
}
