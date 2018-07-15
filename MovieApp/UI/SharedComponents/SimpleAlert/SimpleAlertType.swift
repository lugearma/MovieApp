//
//  SimpleAlertType.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/15/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

enum SimpleAlertType {
  case error(actionHandler: ((UIAlertAction) -> ())?)
}

extension SimpleAlertType {
  
  var title: String {
    switch self {
    case .error:
      return "Error"
    }
  }
  
  var message: String {
    switch self {
    case .error:
      return "Ups! Something when wrong"
    }
  }
  
  var actionTitle: String {
    switch self {
    case .error:
      return "Ok"
    }
  }
  
  var actionHandler: ((UIAlertAction) -> ())? {
    switch self {
    case .error(let handler):
      return handler
    }
  }
}
