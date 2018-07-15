//
//  MoviesListCellViewModel.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/12/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

protocol MoviesListCellViewModelProtocol: class {
  init(movie: Movie)
  
  var movie: Movie { get }
}

final class MoviesListCellViewModel: MoviesListCellViewModelProtocol {
  
  let movie: Movie
  
  init(movie: Movie) {
    self.movie = movie
  }
}
