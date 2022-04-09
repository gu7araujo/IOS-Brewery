//
//  ContentView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 06/04/22.
//

import SwiftUI

private struct Messages: View {
    var title: String
    var message: String

    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.semibold)
                .font(.title)
                .padding()

            Text(message)
                .font(.subheadline)
        }
    }
}

struct HomeView: View {
    @State private var searchText = ""

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color("Yellow"), location: 0.3),
                .init(color: Color("WhiteBackground"), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 300)
                .ignoresSafeArea()

            VStack {
                VStack(alignment: .leading) {
                    Text("Bem vindo,\nEncontre as melhores cervejarias")
                        .font(.headline)

                    CustomTextField(text: $searchText, placeholder: "Buscar local", systemImageName: "magnifyingglass")
                        .defaultLayoutTextField()
                }

                Spacer()

                VStack(alignment: .leading) {
                    Text("Segundo a opinião dos usuários:")
                        .font(.headline)
                    Text("Exibindo 25 de 100 resultados.")
                        .font(.footnote)

                    HStack(spacing: 0) {
                        Spacer()

                        Image(systemName: "a.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.brown, Color("Orange"))

                        Spacer()

                        VStack(alignment: .leading) {
                            Text("Cervejaria A")
                                .font(.headline)
                            Text("Tipo")
                        }

                        Spacer()

                        HStack(alignment: .center, spacing: 3) {
                            Text("3,9")
                                .font(.caption)
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                        }

                        Spacer()
                    }
                    .padding(10)
                    .background(.white)
                    .cornerRadius(15)


                }

                Spacer()
            }
            .padding()
        }
        .onAppear {
            Task {
                await sendApiCall()
            }
        }
    }

    func sendApiCall() async {
        guard let result = await ApiManager.shared.sendRequest(parameters: [:]) else {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

enum RequestType: String {
    case getRequest = "GET"
}

struct Brewery: Decodable {
    let id, name, breweryType: String
    let street: String?
    let city, state, postalCode, country: String
    let longitude, latitude, phone: String?
    let websiteURL: String?
    let updatedAt, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case breweryType = "brewery_type"
        case street, city, state
        case postalCode = "postal_code"
        case country, longitude, latitude, phone
        case websiteURL = "website_url"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
    }
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
