//
//  Alert.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/15/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import UIKit

final class SimpleAlert {
  
  private class func makeAlert(ofType type: SimpleAlertType) -> UIAlertController {
    let alert = UIAlertController(title: type.title, message: type.message, preferredStyle: .alert)
    let action = UIAlertAction(title: type.title, style: .default, handler: type.actionHandler)
    alert.addAction(action)
    return alert
  }
  
  class func presentAlert(_ type: SimpleAlertType, viewController: UIViewController) {
    let alert = makeAlert(ofType: type)
    viewController.present(alert, animated: true, completion: nil)
  }
}

