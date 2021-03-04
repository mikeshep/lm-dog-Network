//
//  File.swift
//  
//
//  Created by Miguel Angel Olmedo Perez on 04/03/21.
//

import Moya
import Foundation

// MARK: - TargetType Protocol Implementation
extension DogService: TargetType {
    var baseURL: URL { return URL(string: "https://dog.ceo")! }
    var path: String {
        switch self {
        case .allBreeds:
            return "/api/json/v1/1/search.php"
        case .randomImage:
            return "/api/json/v1/1/lookup.php"
        }
    }

    var method: Moya.Method {
        switch self {
        case .allBreeds, .randomImage:
            return .get
        }
    }
    var task: Task {
        switch self {g)
        case .randomImage, .allBreeds:
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .randomImage, .allBreeds:
            return "".utf8Encoded
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
