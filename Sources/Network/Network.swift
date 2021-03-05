


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
    
    public func getBreedImages(_ breed: Breed) -> Single<MultipleImageResponse> {
        return provider.request(.images(breed: breed))
    }
    
    public func getBreedRandomImage(_ breed: Breed) -> Single<ImageResponse> {
        return provider.request(.randomBreedImage(breed: breed))
    }
    
    public func getSubBreedRandomImage(_ breed: Breed, subBreed: SubBreed) -> Single<ImageResponse> {
        return provider.request(.randomSubBreedImage(breed: breed, subBreed: subBreed))
    }
}
