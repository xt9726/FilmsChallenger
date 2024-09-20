//
//  MovieRepositoryProtocol.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

protocol MovieRepositoryProtocol {
    func fetchMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void)
}
