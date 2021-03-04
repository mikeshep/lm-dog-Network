


import RxSwift
import Domain
import Foundation

public struct DogAPI {
    
    private let provider = DogProvider()
    private let disposeBag = DisposeBag()
    
    public init() { }
    
    public func getAllBreeds() -> Single<BreedsResponse> {
        return provider.request(.allBreeds)
    }
    
    public func getRandomImage() -> Single<ImageResponseL> {
        return provider.request(.randomImage)
    }
}


public struct ImageResponseL: Codable {
    public let message: URL
    let status: String
}
