//
//  MoviesListCoordinator.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/12/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

final class MoviesListCoordinator: Coordinator {
  
  let navigationController: UINavigationController
  let moviesData: MoviesDataRepositoryProtocol
  
  init(navigationController: UINavigationController, moviesData: MoviesDataRepositoryProtocol) {
    self.navigationController = navigationController
    self.moviesData = moviesData
  }
  
  func start() {
    let moviesListController = createMoviesListController()
    navigationController.pushViewController(moviesListController, animated: true)
  }
  
  private func createMoviesListController() -> UIViewController {
    let moviesListController = MoviesListController()
    let moviesListViewModel = MoviesListViewModel(moviesData: moviesData)
    moviesListViewModel.moviesListCoodinator = self
    moviesListController.viewModel = moviesListViewModel
    return moviesListController
  }
  
  func presentMovieDetail(_ movie: Movie) {
    let movieDetailCoordinator = MovieDetailCoordinator(navigationController: navigationController, moviesData: moviesData, movie: movie)
    movieDetailCoordinator.start()
  }
}
