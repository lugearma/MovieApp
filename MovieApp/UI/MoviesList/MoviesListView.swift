//
//  MoviesListView.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/12/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

final class MoviesListView: UIView {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var emptyResultView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupView()
  }
  
  private func setupView() {
    translatesAutoresizingMaskIntoConstraints = false
    tableView.registerNib(cellType: MoviesListCell.self)
  }
  
  func setDelegateAndDataSourceForTableView(context: UITableViewDelegate & UITableViewDataSource) {
    tableView.dataSource = context
    tableView.delegate = context
  }
  
  func setDelegateForSearchBar(delegate: UISearchBarDelegate) {
    searchBar.delegate = delegate
  }
  
  func updateTable() {
    tableView.reloadData()
  }
  
  func hideKeyboard() {
    searchBar.resignFirstResponder()
  }
  
  func showEmptyResultView() {
    emptyResultView.isHidden = false
  }
  
  func hideEmptyResultView() {
    emptyResultView.isHidden = true
  }
}
