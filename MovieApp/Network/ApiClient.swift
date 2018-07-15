//
//  ApiClient.swift
//  MovieApp
//
//  Created by Luis Gerardo Arias Mateos on 7/13/18.
//  Copyright © 2018 LuisApps. All rights reserved.
//

import Foundation
import Alamofire

enum ApiClientError: LocalizedError {
  case unknown
  case tooManyResults
}

protocol ApiClientProtocol {
  func searchMoviesBy(name: String, page: Int, completion: @escaping (Result<Search>) -> Void)
  func getMovieBy(id: String, completion: @escaping (Result<Movie>) -> Void)
}

extension ApiClientProtocol {
  func defaultRequest(_ urlRequest: URLRequestConvertible) -> DataRequest {
    return request(urlRequest).validate()
  }
}

class ApiClient: ApiClientProtocol {
  
  func defaultCompletionHandler<T: Decodable>(response: DataResponse<Any>, completion: @escaping (Result<T>) -> Void) {
    switch response.result {
    case .failure(let error):
      completion(Result { throw error })
    case .success:
      guard let data = response.data else {
        return completion(Result { throw ApiClientError.unknown })
      }
      
      if let _ = try? JSONDecoder().decode(SearchError.self, from: data) {
        return completion(Result { throw ApiClientError.tooManyResults })
      }
      
      do {
        let object = try JSONDecoder().decode(T.self, from: data)
        completion(Result { return object })
      } catch let error {
        return completion(Result { throw error })
      }
    }
  }
  
  func searchMoviesBy(name: String, page: Int, completion: @escaping (Result<Search>) -> Void) {
    let parameters: Parameters = [
      "s": name,
      "type": SearchCategory.movie.rawValue,
      "page": page
    ]
    defaultRequest(ApiClientRouter.searchMoviesBy(parameters: parameters)).responseJSON { [unowned self] response in
      self.defaultCompletionHandler(response: response, completion: completion)
    }
  }
  
  func getMovieBy(id: String, completion: @escaping (Result<Movie>) -> Void) {
    let parameter: Parameters = [
      "i": id,
      "plot": "full"
    ]
    defaultRequest(ApiClientRouter.movieDetail(parameters: parameter)).responseJSON { [unowned self] response in
      self.defaultCompletionHandler(response: response, completion: completion)
    }
  }
}
