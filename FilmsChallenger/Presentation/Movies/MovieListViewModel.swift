//
//  MovieListViewModel.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

class MovieListViewModel {
    private let fetchMoviesUseCase: FetchMoviesUseCase
    private var currentPage = 1
    private var movies: [Movie] = []
    var isLoading = false
    
    init(fetchMoviesUseCase: FetchMoviesUseCase) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
    }
    
    var numberOfMovies: Int {
        return movies.count
    }
    
    func movie(at index: Int) -> Movie {
        return movies[index]
    }
    
    func loadMovies(completion: @escaping () -> Void) {
        guard !isLoading else { return }
        isLoading = true
        
        fetchMoviesUseCase.execute(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let fetchedMovies):
                self.movies.append(contentsOf: fetchedMovies)
                self.currentPage += 1
                completion()
            case .failure(let error):
                print("Error fetching movies: \(error)")
                completion()
            }
        }
    }
}
