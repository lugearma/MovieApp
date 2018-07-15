//
//  MoviesDataRepository.swift
//  MovieAppTests
//
//  Created by Luis Gerardo Arias Mateos on 7/15/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import XCTest
@testable import MovieApp

class MoviesDataRepositoryTest: XCTestCase {
  
  var apiClient: ApiClientProtocol!
  var moviesDataRepository: MoviesDataRepository!
  
  override func setUp() {
    super.setUp()
    apiClient = MockApiClient()
    moviesDataRepository = MoviesDataRepository(apiClient: apiClient)
  }
  
  func testGetAllMoviesByName() {
    let exp = expectation(description: "Movies expectation")
    moviesDataRepository.moviesBy(name: "Batman", page: 1) { result in
      switch result {
      case .failure(let error):
        XCTFail(error.localizedDescription)
      case .success(let value):
        XCTAssertNotNil(value)
        XCTAssertNotNil(value.movies)
        XCTAssertNotNil(value.response)
        XCTAssertNotNil(value.totalResults)
      }
      exp.fulfill()
    }
    wait(for: [exp], timeout: 5.0)
  }
  
  func testMovieDetail() {
    let exp = expectation(description: "Movie detail expectation")
    moviesDataRepository.movieDetail(id: "121212") { result in
      switch result {
      case .failure(let error):
        XCTFail(error.localizedDescription)
      case .success(let value):
        XCTAssertNotNil(value)
        XCTAssertNotNil(value.id)
        XCTAssertNotNil(value.plot)
        XCTAssertNotNil(value.posterPath)
        XCTAssertNotNil(value.posterURL)
        XCTAssertNotNil(value.title)
        XCTAssertNotNil(value.type)
        XCTAssertNotNil(value.year)
      }
      exp.fulfill()
    }
    wait(for: [exp], timeout: 5.0)
  }
  
}
