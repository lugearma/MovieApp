//
//  MovieDetailViewModelTest.swift
//  MovieAppTests
//
//  Created by Luis Gerardo Arias Mateos on 7/15/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import Foundation

import XCTest
@testable import MovieApp

class MoviesDetailViewModelTest: XCTestCase {
  
  var viewModel: MovieDetailViewModelProtocol!
  var dataRepository: MoviesDataRepository!
  var apiClient: ApiClientProtocol!
  
  override func setUp() {
    super.setUp()
    apiClient = MockApiClient()
    dataRepository = MoviesDataRepository(apiClient: apiClient)
    viewModel = MovieDetailViewModel(moviesData: dataRepository)
  }
  
  func testGetMovieDetailDelegate() {
    let spy = SpyMovieDetailViewModelDelegate()
    viewModel.delegate = spy
    viewModel.movie = Movie(title: "Batman", year: "2018", id: "1", type: .movie, posterPath: "path", plot: "plot")
    viewModel.getMovieDetail()
    
    XCTAssertTrue(spy.didReceiveMovieDetails)
  }
}

// MARK: MovieDetailViewModelDelegate

class SpyMovieDetailViewModelDelegate: MovieDetailViewModelDelegate {
  
  var didReceiveMovieDetails = false
  
  func didThrow(error: Error) {
    XCTFail(error.localizedDescription)
  }
  
  func didReceiveMovieDetails(details: Movie) {
    didReceiveMovieDetails = true
  }
}
