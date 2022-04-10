//
//  BreweryUseCase.swift
//  Application
//
//  Created by Gustavo Araujo Santos on 09/04/22.
//

import Foundation
import Infrastructure

public class BreweryUseCase {

    // MARK: - Initialization

    public init() { }

    // MARK: - Public methods

    public func execute(name: String) async {
        guard let result = await HTTPNetworkClient.shared.sendRequest(parameters: ["query": name]) else {
            return
        }

        switch result {
        case .success(let data):
            print(data)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
