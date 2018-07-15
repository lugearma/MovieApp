//
//  MoviesListViewModelTest.swift
//  MovieAppTests
//
//  Created by Luis Gerardo Arias Mateos on 7/15/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import Foundation

import XCTest
@testable import MovieApp

class MoviesListViewModelTest: XCTestCase {
  
  var viewModel: MoviesListViewModelProtocol!
  var dataRepository: MoviesDataRepository!
  var apiClient: ApiClientProtocol!
  
  override func setUp() {
    super.setUp()
    apiClient = MockApiClient()
    dataRepository = MoviesDataRepository(apiClient: apiClient)
    viewModel = MoviesListViewModel(moviesData: dataRepository)
  }
  
  func testGetMovies() {
    let spy = SpyMoviesListViewModelDelegate()
    viewModel.delegate = spy
    viewModel.loadMovies()
    
    XCTAssertTrue(spy.didGetMovies)
  }
}

// MARK: MoviesListViewModelDelegate

class SpyMoviesListViewModelDelegate: MoviesListViewModelDelegate {
  
  var didGetMovies = false
  
  func didThrow(error: Error) {
    XCTFail(error.localizedDescription)
  }
  
  func didGetSearchResult(search: Search) {
    didGetMovies = true
  }
}
