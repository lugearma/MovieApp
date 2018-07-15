//
//  MoviesListCell.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/12/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

final class MoviesListCell: UITableViewCell {
  
  var viewModel: MoviesListCellViewModelProtocol? {
    didSet {
      guard let movie = viewModel?.movie else {
        preconditionFailure("nil value for viewModel")
      }
      configureCell(movie: movie)
    }
  }
  
  @IBOutlet weak var moviePoster: UIImageView!
  @IBOutlet weak var movieName: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configureCell(movie: Movie) {
    let placeholder = UIImage(named: "placeholder")
    moviePoster.kf.setImage(with: movie.posterURL, placeholder: placeholder)
    movieName.text = movie.title
  }
}
