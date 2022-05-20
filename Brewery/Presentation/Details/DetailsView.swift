//
//  SwiftUIView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 28/04/22.
//

import SwiftUI
import Domain
import Application

struct DetailsView: View {
    let brewery: Brewery

    @State private var alreadyEvaluated = false
    @State private var showingRatingView = false
    @State private var showingAlertError = false

    init(_ brewery: Brewery) {
        self.brewery = brewery
    }

    var body: some View {
        VStack {
            Image(systemName: "\(brewery.name.getFirstLetter()).circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80.0, height: 80.0)
                .foregroundStyle(Color("Yellow"))

            Text(brewery.name)
                .font(.headline)

            Text("+500 avaliações")
                .font(.caption)
                .foregroundColor(.secondary)

            HStack {
                Text("Tipo")
                Text(brewery.breweryType)
            }

            if let site = brewery.websiteURL {
                HStack {
                    Text("Site")
                    Link(site, destination: createURL(site))
                }
            }

            HStack {
                Text("Endereço")
                Text("\(brewery.street ?? ""), \(brewery.city ?? "")")
            }

            if alreadyEvaluated {
                Text("Você já avaliou está cervejaria!")
                    .padding(10)
                    .foregroundColor(.green)
            } else {
                Button {
                    showingRatingView.toggle()
                } label: {
                    Text("Avaliar")
                        .padding(10)
                        .padding(.horizontal, 20)
                        .background(.yellow)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $showingRatingView, onDismiss: feedbackFromRating) {
                    RatingView(breweryId: brewery.id)
                }
            }
        }
        .padding(.horizontal)
        .alert("Erro", isPresented: $showingAlertError) {
            Button("OK") { }
        } message: {
            Text(ProjectError.handleGetRatingError.localizedDescription)
        }
        .onAppear {
            alreadyContainsRating()
        }
    }

    private func alreadyContainsRating() {
        let useCase = GetRatingUseCase()
        let response = useCase.execute(breweryId: brewery.id)

        switch response {
        case .success:
            alreadyEvaluated = true
        case .failure:
            showingAlertError = true
        }
    }

    private func feedbackFromRating() {
        alreadyContainsRating()
    }

    private func createURL(_ link: String) -> URL {
        guard let url = URL(string: link) else {
            fatalError("invalid Link")
        }

        return url
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    // swiftlint:disable:next line_length
    static let brewery = Brewery(id: "1", name: "Cervejaria Teste 1234", breweryType: "Pub", street: "Rua Mario Campos 381", city: "Sao Paulo", state: "MG", postalCode: "35610-000", country: "Brazil", longitude: nil, latitude: nil, phone: "(37) 3551-1513", websiteURL: "www.site.com.br", updatedAt: "2022-05-01", createdAt: "2022-05-01")

    static var previews: some View {
        DetailsView(brewery)
    }
}
