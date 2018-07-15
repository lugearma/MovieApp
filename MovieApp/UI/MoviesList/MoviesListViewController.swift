//
//  MoviesListController.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/12/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit
import Alamofire

final class MoviesListController: UIViewController {
  
  lazy var moviesListView: MoviesListView = Bundle.main.loadNib()
  var movies = [Movie]()
  
  var viewModel: MoviesListViewModelProtocol? {
    didSet {
      viewModel?.delegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  private func setupView() {
    navigationItem.title = "Movies"
    view.addSubview(moviesListView)
    moviesListView.setDelegateAndDataSourceForTableView(context: self)
    moviesListView.setDelegateForSearchBar(delegate: self)
    moviesListView.constraintViewToFillTo(view: view)
  }
  
  private func loadNextPage() {
    viewModel?.loadNextPage()
  }
}

// MARK: UITableViewDataSource

extension MoviesListController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: MoviesListCell = tableView.dequeueCell(indexPath: indexPath)
    cell.viewModel = MoviesListCellViewModel(movie: movies[indexPath.row])
    
    if movies.count % 10 == 0 && indexPath.item == movies.count - 1 {
      loadNextPage()
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
}

// MARK: - UITableViewDelegate

extension MoviesListController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let movie = movies[indexPath.row]
    viewModel?.presentMovieDetail(movie)
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    moviesListView.hideKeyboard()
  }
}

// MARK: - MoviesListViewModelDelegate

extension MoviesListController: MoviesListViewModelDelegate {
  
  func didThrow(error: Error) {
    guard
      let clientError = error as? ApiClientError,
      clientError != .unknown else {
        presentAlert()
      return
    }
  }
  
  func didGetSearchResult(search: Search) {
    movies += search.movies
    moviesListView.updateTable()
  }
  
  private func presentAlert() {
    SimpleAlert.presentAlert(.error(actionHandler: nil), viewController: self)
  }
}

// MARK: - UISearchBarDelegate

extension MoviesListController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    guard
      let name = searchBar.text,
      !name.isEmpty else {
      return
    }
    movies.removeAll()
    moviesListView.updateTable()
    viewModel?.searchMovieByName(name)
  }
}
