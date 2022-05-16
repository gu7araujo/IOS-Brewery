//
//  SwiftUIView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 28/04/22.
//

import SwiftUI
import Domain

struct DetailsView: View {
    var brewery: Brewery

    @State private var alreadyEvaluated = false
    @State private var showingRatingView = false

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
                    RatingView()
                }
            }
        }
        .padding(.horizontal)
    }

    func feedbackFromRating() {
        print("Voltei da avaliacao")
    }

    func createURL(_ link: String) -> URL {
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
        DetailsView(brewery: brewery)
    }
}
