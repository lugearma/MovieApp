//
//  MoviesListViewModel.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/12/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit
import Alamofire

protocol MoviesListViewModelDelegate: class {
  func didThrow(error: Error)
  func didGetSearchResult(search: Search)
}

protocol MoviesListViewModelProtocol: class {
  var moviesData: MoviesDataRepositoryProtocol { get }
  var moviesListCoodinator: MoviesListCoordinator? { get set }
  var delegate: MoviesListViewModelDelegate? { get set }
  var currentPage: Int { get set }
  var movieName: String { get set }
  func loadMovies()
  func searchMovieByName(_ name: String)
  func presentMovieDetail(_ movie: Movie)
  func loadNextPage()
}

final class MoviesListViewModel: MoviesListViewModelProtocol {
  
  let moviesData: MoviesDataRepositoryProtocol
  var moviesListCoodinator: MoviesListCoordinator?
  var currentPage = 1
  var movieName = String()
  weak var delegate: MoviesListViewModelDelegate?
  
  init(moviesData: MoviesDataRepositoryProtocol) {
    self.moviesData = moviesData
  }
  
  func loadMovies() {
    moviesData.moviesBy(name: "Batman", page: currentPage, completion: { [weak self] result in
      switch result {
      case .failure(let error):
        self?.delegate?.didThrow(error: error)
      case .success(let value):
        self?.delegate?.didGetSearchResult(search: value)
      }
    })
  }
  
  func loadNextPage() {
    currentPage += 1
    moviesData.moviesBy(name: movieName, page: currentPage, completion: { [weak self] result in
      switch result {
      case .failure(let error):
        self?.delegate?.didThrow(error: error)
      case .success(let value):
        self?.delegate?.didGetSearchResult(search: value)
      }
    })
  }
  
  func searchMovieByName(_ name: String) {
    movieName = name
    moviesData.moviesBy(name: name, page: 1, completion: { [weak self] result in
      switch result {
      case .failure(let error):
        self?.delegate?.didThrow(error: error)
      case .success(let value):
        self?.delegate?.didGetSearchResult(search: value)
      }
    })
  }
  
  func presentMovieDetail(_ movie: Movie) {
    moviesListCoodinator?.presentMovieDetail(movie)
  }
}
