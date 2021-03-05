//
//  File.swift
//  
//
//  Created by Miguel Angel Olmedo Perez on 04/03/21.
//

import Foundation
import Domain

enum DogService {
    case allBreeds
    case randomImage
    case allSubBreeds(breed: Breed)
    case images(breed: Breed)
    case randomBreedImage(breed: Breed)
    case randomSubBreedImage(breed: Breed, subBreed: SubBreed)
}
