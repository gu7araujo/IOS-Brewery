//
//  BreweryUseCase.swift
//  Application
//
//  Created by Gustavo Araujo Santos on 09/04/22.
//

import Foundation
import Infrastructure
import Domain

public class BreweryUseCase {

    public static var shared = BreweryUseCase()

    // MARK: - Initialization

    public init() { }

    // MARK: - Public methods

    public func execute(name: String) async -> Result<[Brewery], Error> {
        let result = await HTTPNetworkClient.shared.sendRequest(parameters: ["query": name])

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
