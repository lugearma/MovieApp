//
//  UIView.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

extension UIView {
  
  func constraintViewToFillTo(view: UIView) {
    leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}
