//
//  UITableViewCell.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/15/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

extension UITableViewCell {
  
  static var identifier: String {
    return String(describing: self.self)
  }
  
  static var nib: UINib? {
    return UINib(nibName: identifier, bundle: nil)
  }
}
