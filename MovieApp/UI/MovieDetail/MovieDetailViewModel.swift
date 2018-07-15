//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import Foundation

protocol MovieDetailViewModelDelegate: class {
  func didThrow(error: Error)
  func didReceiveMovieDetails(details: Movie)
}

protocol MovieDetailViewModelProtocol: class {
  var movie: Movie? { get set }
  var moviesData: MoviesDataRepositoryProtocol { get }
  var delegate: MovieDetailViewModelDelegate? { get set }
  
  func getMovieDetail()
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
  
  var movie: Movie?
  let moviesData: MoviesDataRepositoryProtocol
  
  init(moviesData: MoviesDataRepositoryProtocol) {
    self.moviesData = moviesData
  }
  
  func getMovieDetail() {
    guard let id = movie?.id else {
      preconditionFailure("nil value for movie")
    }
    moviesData.movieDetail(id: id) { [weak self] result in
      switch result {
      case .failure(let error):
        self?.delegate?.didThrow(error: error)
      case .success(let value):
        self?.delegate?.didReceiveMovieDetails(details: value)
      }
    }
  }
  
  
  weak var delegate: MovieDetailViewModelDelegate?
}
