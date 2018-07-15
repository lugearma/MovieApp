//
//  MovieDetailCoordinator.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

final class MovieDetailCoordinator: Coordinator {
  
  let navigationController: UINavigationController
  let moviesData: MoviesDataRepositoryProtocol
  let movie: Movie
  
  init(navigationController: UINavigationController, moviesData: MoviesDataRepositoryProtocol, movie: Movie) {
    self.navigationController = navigationController
    self.moviesData = moviesData
    self.movie = movie
  }
  
  func start() {
    let movieDetailController = createMovieDetailController()
    navigationController.pushViewController(movieDetailController, animated: true)
  }
  
  private func createMovieDetailController() -> UIViewController {
    let movieDetailController = MovieDetailController()
    let movieViewModel = MovieDetailViewModel(moviesData: moviesData)
    movieViewModel.movie = movie
    movieDetailController.viewModel = movieViewModel
    
    return movieDetailController
  }
}
