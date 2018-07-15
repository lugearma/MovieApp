//
//  MovieDetailController.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

final class MovieDetailController: UIViewController {
  
  fileprivate lazy var movieDetailView: MovieDetailView = Bundle.main.loadNib()
  
  var viewModel: MovieDetailViewModelProtocol? {
    didSet {
      viewModel?.delegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    requestMovieDetails()
  }
  
  private func setupView() {
    navigationItem.title = viewModel?.movie?.title
    view.addSubview(movieDetailView)
    movieDetailView.translatesAutoresizingMaskIntoConstraints = false
    movieDetailView.constraintViewToFillTo(view: view)
  }
  
  private func requestMovieDetails() {
    viewModel?.getMovieDetail()
  }
}

// MARK: - MovieDetailViewModelDelegate

extension MovieDetailController: MovieDetailViewModelDelegate {
  
  func didThrow(error: Error) {
    presentAlert { [weak self] _ in
      self?.navigationController?.popViewController(animated: true)
    }
  }
  
  func didReceiveMovieDetails(details: Movie) {
    movieDetailView.feedView(details: details)
  }
  
  private func presentAlert(handler: @escaping (UIAlertAction) -> Void) {
    SimpleAlert.presentAlert(.error(actionHandler: handler), viewController: self)
  }
}

