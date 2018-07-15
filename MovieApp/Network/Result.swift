//
//  Result.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import Foundation

enum Result<T> {
  case success(T)
  case failure(Error)
}

extension Result {
  init(_ capturing: () throws -> T) {
    do {
      self = .success(try capturing())
    } catch {
      self = .failure(error)
    }
  }
}
