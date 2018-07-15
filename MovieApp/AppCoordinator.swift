//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/12/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
  
  let window: UIWindow
  var navigationController: UINavigationController
  let apiClient: ApiClientProtocol
  
  init(window: UIWindow, apiClient: ApiClientProtocol) {
    self.window = window
    self.apiClient = apiClient
    navigationController = UINavigationController()
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
  
  func start() {
    presentMoviesList()
  }
}

// MARK: - MoviesListCoordinator

extension AppCoordinator {
  
  func presentMoviesList() {
    let moviesData = MoviesDataRepository(apiClient: apiClient)
    let moviesListCoordinator = MoviesListCoordinator(navigationController: navigationController, moviesData: moviesData)
    moviesListCoordinator.start()
  }
}
