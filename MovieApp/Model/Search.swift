//
//  Search.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/14/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import Foundation

struct Search: Codable {
  let movies: [Movie]
  let totalResults: String
  let response: String
  
  enum CodingKeys: String, CodingKey {
    case movies = "Search"
    case totalResults
    case response = "Response"
  }
}
