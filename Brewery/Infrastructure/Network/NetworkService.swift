//
//  NetworkService.swift
//  Infrastructure
//
//  Created by Gustavo Araujo Santos on 09/04/22.
//

import Foundation
import Domain

enum RequestType: String {
    case getRequest = "GET"
}

public final class HTTPNetworkClient {
    private let baseURL = "https://api.openbrewerydb.org/breweries"

    public static var shared = HTTPNetworkClient()

    private var request: URLRequest?

    public init () {}

    public func sendRequest(parameters: [String: Any]) async -> Result<[Brewery], Error>? {
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
