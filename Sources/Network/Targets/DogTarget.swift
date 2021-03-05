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
            return "/api/breeds/list/all"
        case .randomImage:
            return "/api/breeds/image/random"
        case .allSubBreeds(let breed):
            return "/api/breed/\(breed)/list"
        case .images(let breed):
            return "/api/breed/\(breed)/images"
        case .randomBreedImage(let breed):
            return "/api/breed/\(breed)/images/random"
        case .randomSubBreedImage(let breed, let subBreed):
            return "/api/breed/\(breed)/\(subBreed)/images/random"
        }
    }

    var method: Moya.Method {
        switch self {
        case .allBreeds, .randomImage, .allSubBreeds, .images, .randomBreedImage, .randomSubBreedImage:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .randomImage, .allBreeds, .allSubBreeds, .images, .randomBreedImage, .randomSubBreedImage:
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .randomImage, .allBreeds, .allSubBreeds, .images, .randomBreedImage, .randomSubBreedImage:
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
