import XCTest
import RxSwift
@testable import Network

final class NetworkTests: XCTestCase {
    
    let api = DogAPI()
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
    }
    

    func test_get_all_breeds() {
        //Given
        let expect = expectation(description: "Waiting for request...")
        
        //When
        api.getAllBreeds()
            .subscribe { _ in
                //Then
                expect.fulfill()
            } onError: { (error) in
                //Then
                XCTFail("Error \(error)")
            }.disposed(by: disposeBag)
        waitForExpectations(timeout: 2)
    }
    
    func test_get_ramdom_image() {
        //Given
        let expect = expectation(description: "Waiting for request...")
        
        //When
        api.getRandomImage()
            .subscribe { response in
                //Then
                expect.fulfill()
            } onError: { (error) in
                //Then
                XCTFail("Error \(error)")
            }.disposed(by: disposeBag)
        waitForExpectations(timeout: 2)
    }
    
    func test_get_all_subbreeds_for_hound() {
        //Given
        let expect = expectation(description: "Waiting for request...")
        
        //When
        api.getAllSubBreeds(for: "hound")
            .subscribe { response in
                //Then
                expect.fulfill()
            } onError: { (error) in
                //Then
                XCTFail("Error \(error)")
            }.disposed(by: disposeBag)
        waitForExpectations(timeout: 2)
    }
    
    func test_get_all_subbreeds_for_affenpinscher_isEmpty() {
        //Given
        let expect = expectation(description: "Waiting for request...")
        
        //When
        api.getAllSubBreeds(for: "affenpinscher")
            .subscribe { response in
                //Then
                XCTAssert(response.message.isEmpty)
                expect.fulfill()
            } onError: { (error) in
                //Then
                XCTFail("Error \(error)")
            }.disposed(by: disposeBag)
        waitForExpectations(timeout: 2)
    }
    
    static var allTests = [
        ("test_get_all_breeds", test_get_all_breeds),
        ("test_get_ramdom_image", test_get_ramdom_image),
        ("test_get_all_subbreeds_for_hound", test_get_all_subbreeds_for_hound),
        ("test_get_all_subbreeds_for_affenpinscher_isEmpty", test_get_all_subbreeds_for_affenpinscher_isEmpty)
    ]
}
