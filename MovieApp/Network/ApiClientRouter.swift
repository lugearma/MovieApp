//
//  ApiClientRouter.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import Foundation
import Alamofire

enum ApiClientRouter {
  case searchMoviesBy(parameters: Parameters)
  case movieDetail(parameters: Parameters)
}

extension ApiClientRouter: URLRequestConvertible, URLConvertible {
  
  var baseURL: String {
    guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "MovieAppBaseURL") as? String else {
      preconditionFailure("API configuration is not set")
    }
    return apiBaseURL
  }
  
  func asURLRequest() throws -> URLRequest {
    let result: (path: String, parameters: Parameters) = {
      switch self {
      case .searchMoviesBy(let parameters):
        return ("", parameters)
      case .movieDetail(let parameters):
        return ("", parameters)
      }
    }()
    
    let url = try baseURL.asURL()
    let urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
    let parameters = result.parameters.merging(["apikey": "1e700da7"]){ current, _ in current }
    return try URLEncoding.default.encode(urlRequest, with: parameters)
  }
  
  func asURL() throws -> URL {
    guard let url = try asURLRequest().url else {
      preconditionFailure("Couldn't get URL")
    }
    
    return url
  }
}
