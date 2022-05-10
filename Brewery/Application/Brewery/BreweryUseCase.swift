//
//  BreweryUseCase.swift
//  Application
//
//  Created by Gustavo Araujo Santos on 09/04/22.
//

import Foundation
import Infrastructure
import Domain

public protocol BreweryUseCaseProtocol {
    func execute(name: String) async -> Result<[Brewery], Error>
}

public class BreweryUseCase: BreweryUseCaseProtocol {

    public static var shared: BreweryUseCaseProtocol = BreweryUseCase()
    private let network: NetworkProtocol

    // MARK: - Initialization

    public init(network: NetworkProtocol = HTTPNetworkClient.shared) {
        self.network = network
    }

    // MARK: - Public methods

    public func execute(name: String) async -> Result<[Brewery], Error> {
        let result = await network.sendRequest(parameters: ["query": name])

        switch result {
        case .success(let data):
            do {
                let parsedData = try JSONDecoder().decode([Brewery].self, from: data)

                return .success(parsedData)
            } catch {
                return .failure(ProjectError.handleResponseError)
            }
        case .failure(let error):
            if error as? NetworkError == NetworkError.badRequest {
                return .failure(ProjectError.handleResponseError)
            }
            return .failure(error)
        }
    }
}
