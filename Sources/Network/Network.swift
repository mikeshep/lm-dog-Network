


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
    
    public func getRandomImage() -> Single<ImageResponse> {
        return provider.request(.randomImage)
    }
    
    public func getAllSubBreeds(for breed: String) -> Single<SubBreedsResponse> {
        return provider.request(.allSubBreeds(breed: breed))
    }
}
