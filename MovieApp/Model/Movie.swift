//
//  Movie.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit
import Kingfisher

enum SearchCategory: String, Codable {
  case movie
}

struct Movie: Codable {
  let title: String
  let year: String
  let id: String
  let type: SearchCategory
  let posterPath: String
  let plot: String?
  var posterURL: URL? {
    return URL(string: posterPath)
  }
  
  enum CodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case id = "imdbID"
    case type = "Type"
    case plot = "Plot"
    case posterPath = "Poster"
  }
}
