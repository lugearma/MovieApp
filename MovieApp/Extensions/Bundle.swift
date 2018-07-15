//
//  Bundle.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/12/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

extension Bundle {
  
  func loadNib<T>() -> T {
    let name = String(describing: T.self)
    guard let view = loadNibNamed(name, owner: T.self, options: nil)?.last as? T else {
      fatalError()
    }
    
    return view
  }
}
