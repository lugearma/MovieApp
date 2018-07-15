//
//  UITableView.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

extension UITableView {
  
  func dequeueCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
      preconditionFailure("Couldn't dequeue cell")
    }
    
    return cell
  }
  
  func registerNib(cellType: AnyClass) {
    guard let T = cellType as? UITableViewCell.Type else {
      preconditionFailure("Could'n cast value")
    }
    register(T.nib, forCellReuseIdentifier: T.identifier)
  }
}
