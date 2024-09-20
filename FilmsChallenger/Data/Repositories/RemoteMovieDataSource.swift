//
//  RemoteMovieDataSource.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Alamofire
import Foundation

protocol RemoteMovieDataSourceProtocol {
    func fetchMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void)
}

class RemoteMovieDataSource: RemoteMovieDataSourceProtocol {
    private let apiKey = "f46b58478f489737ad5a4651a4b25079"
    private let baseUrl = "https://api.themoviedb.org/3/movie/upcoming"
    
    func fetchMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let url = URL(string: "\(baseUrl)?page=\(page)&api_key=\(apiKey)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(movieResponse.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
