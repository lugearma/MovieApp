//
//  MoviesData.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import Foundation

protocol MoviesDataRepositoryProtocol: class {
  init(apiClient: ApiClientProtocol)
  
  var apiClient: ApiClientProtocol { get }
  
  func moviesBy(name: String, page: Int, completion: @escaping (Result<Search>) -> Void)
  func movieDetail(id: String, completion: @escaping (Result<Movie>) -> Void)
}

class MoviesDataRepository: MoviesDataRepositoryProtocol {
  let apiClient: ApiClientProtocol
  
  required init(apiClient: ApiClientProtocol) {
    self.apiClient = apiClient
  }
  
  func moviesBy(name: String, page: Int, completion: @escaping (Result<Search>) -> Void) {
    apiClient.searchMoviesBy(name: name, page: page) { result in
      switch result {
      case .failure(let error):
        completion(Result { throw error })
      case .success(let value):
        completion(Result { return value })
      }
    }
  }
  
  func movieDetail(id: String, completion: @escaping (Result<Movie>) -> Void) {
    apiClient.getMovieBy(id: id) { result in
      switch result {
      case .failure(let error):
        completion(Result { throw error })
      case .success(let value):
        completion(Result { return value })
      }
    }
  }
}
