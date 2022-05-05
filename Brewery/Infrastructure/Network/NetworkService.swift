//
//  NetworkService.swift
//  Infrastructure
//
//  Created by Gustavo Araujo Santos on 09/04/22.
//

import Foundation

public protocol Network {
    func sendRequest(parameters: [String: Any]) async -> Result<Data, Error>
}

enum RequestType: String {
    case getRequest = "GET"
}

public final class HTTPNetworkClient: Network {
    private let baseURL = "https://api.openbrewerydb.org/breweries/search"

    public static var shared: Network = HTTPNetworkClient()

    private var request: URLRequest?

    private init() {}

    public func sendRequest(parameters: [String: Any]) async -> Result<Data, Error> {
        do {
            guard let urlRequest = createGetRequestWithURLComponents(parameters: parameters) else {
                return .failure(NetworkError.badRequest)
            }

            let (data, _) = try await URLSession.shared.data(for: urlRequest)

            return .success(data)
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
