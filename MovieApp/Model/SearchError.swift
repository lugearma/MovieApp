//
//  SearchError.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/15/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import Foundation

enum ErrorType: String, Codable {
  case tooManyResults = "Too many results."
  case movieNotFound = "Movie not found!"
}

struct SearchError: Codable {
  let response: String
  let error: ErrorType
  
  enum CodingKeys: String, CodingKey {
    case response = "Response"
    case error = "Error"
  }
}
