//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

final class MovieDetailView: UIView {
  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var descriptionTextView: UITextView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func feedView(details: Movie) {
    let placeholder = UIImage(named: "placeholder")
    posterImageView.kf.setImage(with: details.posterURL, placeholder: placeholder)
    descriptionTextView.text = details.plot
  }
}
