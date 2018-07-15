//
//  MockApiClient.swift
//  MovieAppTests
//
//  Created by Luis Gerardo Arias Mateos on 7/15/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import Foundation
@testable import MovieApp

class MockApiClient: ApiClient {
  
  override func searchMoviesBy(name: String, page: Int, completion: @escaping (Result<Search>) -> Void) {
    let movieOne = Movie(title: "Batman Begins", year: "2303", id: "asasa", type: .movie, posterPath: "noPoster", plot: nil)
    let movieTwo = Movie(title: "Hulk", year: "2303", id: "asasa", type: .movie, posterPath: "noPoster", plot: nil)
    let search = Search(movies: [movieOne, movieTwo], totalResults: "12", response: "True")
    
    completion(Result { return search })
  }
  
  override func getMovieBy(id: String, completion: @escaping (Result<Movie>) -> Void) {
    let movie = Movie(title: "Batman", year: "2303", id: "fdfdfd", type: .movie, posterPath: "pososter", plot: "hersPlot")
    completion(Result { return movie })
  }
}
