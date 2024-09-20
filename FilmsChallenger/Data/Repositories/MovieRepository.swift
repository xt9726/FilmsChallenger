//
//  MovieRepository.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

class MovieRepository: MovieRepositoryProtocol {
    private let remoteDataSource: RemoteMovieDataSourceProtocol
    
    init(remoteDataSource: RemoteMovieDataSourceProtocol = RemoteMovieDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        remoteDataSource.fetchMovies(page: page, completion: completion)
    }
}
