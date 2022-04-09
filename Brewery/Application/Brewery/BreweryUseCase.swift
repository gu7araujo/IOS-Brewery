//
//  BreweryUseCase.swift
//  Application
//
//  Created by Gustavo Araujo Santos on 09/04/22.
//

import Foundation
import Domain

public class BreweryUseCase {

    // MARK: - Initialization

    public init() { }

    // MARK: - Public methods

    public func execute() {
        
    }
}


enum RequestType: String {
    case getRequest = "GET"
}

class ApiManager {
    private let baseURL = "https://api.openbrewerydb.org/breweries"

    static var shared = ApiManager()

    private var request: URLRequest?

    private init () {}

    func sendRequest(parameters: [String: Any]) async -> Result<[Brewery], Error>? {
        do {
            guard let urlRequest = createGetRequestWithURLComponents(parameters: parameters) else {
                return nil
            }

            let (data, _) = try await URLSession.shared.data(for: urlRequest)

            let parsedData = try JSONDecoder().decode([Brewery].self, from: data)

            return .success(parsedData)
        } catch {
            return .failure(error)
        }
    }

    private func createGetRequestWithURLComponents(parameters: [String: Any]) -> URLRequest? {
        var components = URLComponents(string: baseURL)!

        components.queryItems = parameters.map({ (key: String, value: Any) in
            URLQueryItem(name: key, value: "\(value)")
        })

        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")

        request = URLRequest(url: components.url!)

        request?.httpMethod = RequestType.getRequest.rawValue

        return request
    }
}
