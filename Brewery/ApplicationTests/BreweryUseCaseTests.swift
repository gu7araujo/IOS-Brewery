//
//  ApplicationTests.swift
//  ApplicationTests
//
//  Created by Gustavo Araujo Santos on 10/05/22.
//

import XCTest
@testable import Application
@testable import Infrastructure

class NetworkMock: NetworkProtocol {
    var isSuccess: Bool

    public init(isSuccess: Bool = true) {
        self.isSuccess = isSuccess
    }

    func sendRequest(parameters: [String : Any]) async -> Result<Data, Error> {
        switch isSuccess {
        case true:
            return .success("testData".data(using: .ascii)!)
        case false:
            return .failure(NetworkError.badRequest)
        }
    }
}


class BreweryUseCaseTests: XCTestCase {

    var sut: BreweryUseCaseProtocol?

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_ExecuteReturnFailure() async {
        let networkMock = NetworkMock(isSuccess: false)
        sut = BreweryUseCase(network: networkMock)

        let response = await sut?.execute(name: "Brazil")

        switch response {
        case .failure(let error):
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, ProjectError.handleResponseError.localizedDescription)
        default:
            XCTFail("The API request returned success.")
        }
    }

}
