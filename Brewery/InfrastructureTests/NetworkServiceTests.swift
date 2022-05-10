//
//  InfrastructureTests.swift
//  InfrastructureTests
//
//  Created by Gustavo Araujo Santos on 10/05/22.
//

import XCTest
@testable import Infrastructure

class NetworkServiceTests: XCTestCase {

    var api: Network?

    override func setUp() {
        super.setUp()
        api = HTTPNetworkClient.shared
    }

    override func tearDown() {
        super.tearDown()
        api = nil
    }

    func test_ExecuteSendRequestSuccessReturn() async {
        let response = await api?.sendRequest(parameters: ["query": "Brazil"])

        switch response {
        case .success(let data):
            XCTAssertNotNil(data)
            XCTAssertEqual(data.isEmpty, false)
        default:
            XCTFail("API call response failed.")
        }
    }
}
