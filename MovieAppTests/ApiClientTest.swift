//
//  ApiClientTest.swift
//  MovieAppTests
//
//  Created by Luis Gerardo Arias Mateos on 7/14/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import XCTest
@testable import MovieApp

class ApiClientTest: XCTestCase {
  
  var apiClient: ApiClientProtocol!
  
  override func setUp() {
    super.setUp()
    apiClient = ApiClient()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testSuccessResponseForSearchMovies() {
    let exp = expectation(description: "Get movies success result")
    apiClient.searchMoviesBy(name: "Batman", page: 1, completion: { result in
      switch result {
      case .failure:
        XCTFail()
      case .success(let value):
        XCTAssertNotNil(value)
      }
      exp.fulfill()
    })
    wait(for: [exp], timeout: 10.0)
  }
  
  func testErrorResponseForSearchMovies() {
    let exp = expectation(description: "Get movies error result")
    apiClient.searchMoviesBy(name: "Batman", page: 99, completion: { result in
      switch result {
      case .failure(let error):
        XCTAssertNotNil(error)
      case .success(let value):
        XCTAssertNil(value)
      }
      exp.fulfill()
    })
    wait(for: [exp], timeout: 10.0)
  }
  
  func testSuccessResponseForMovieDetail() {
    let exp = expectation(description: "Get movies detail success result")
    apiClient.getMovieBy(id: "tt4296026", completion: { result in
      switch result {
      case .failure:
        XCTFail()
      case .success(let value):
        XCTAssertNotNil(value)
      }
      exp.fulfill()
    })
    wait(for: [exp], timeout: 10.0)
  }
  
  func testErrorResponseForMoviesDetail() {
    let exp = expectation(description: "Get movies detail success result")
    apiClient?.getMovieBy(id: "0000", completion: { result in
      switch result {
      case .failure(let error):
        XCTAssertNotNil(error)
      case .success:
        XCTFail()
      }
      exp.fulfill()
    })
    wait(for: [exp], timeout: 10.0)
  }
}
