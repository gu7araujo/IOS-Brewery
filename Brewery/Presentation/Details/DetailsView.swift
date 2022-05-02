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

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color("Yellow"), location: 0.3),
                    .init(color: Color("WhiteBackground"), location: 0.3)
                ], center: .top, startRadius: geometry.size.height * 0.1, endRadius: geometry.size.height * 1)
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "\(brewery.name.getFirstLetter()).circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80.0, height: 80.0)
                            .foregroundStyle(.brown, Color("Orange"))

                        Spacer()

                        VStack {
                            Text(brewery.name)
                                .font(.headline)
                            EvaluationScoring()
                            Text("+500 avaliacoes")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 30)

                    HStack {
                        Text("Tipo")
                        Spacer()
                        Text(brewery.breweryType)
                    }
                    .padding(.bottom, 15)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)

                    if let site = brewery.websiteURL {
                        HStack {
                            Text("Site")
                            Spacer()
                            Text(site)
                        }
                        .padding(.bottom, 15)

                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                    }

                    if let street = brewery.street, let city = brewery.city {
                        HStack {
                            Text("Endereço")
                            Spacer()
                            Text("\(street), \(city)")
                        }
                        .padding(.bottom, 15)
                    }

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)

                    Button {
                        //
                    } label: {
                        Text("Avaliar Cervejaria")
                    }
                    .padding(10)
                    .padding(.horizontal, 30)
                    .foregroundColor(.black)
                    .background(Color("Yellow"))
                    .cornerRadius(5)
                    .padding(30)
                }
                .frame(width: geometry.size.width * 0.8)
                .padding()
                .background(.white)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    // swiftlint:disable:next line_length
    static let brewery = Brewery(id: "1", name: "Cervejaria Teste 1234", breweryType: "Pub", street: "Rua Mario Campos 381", city: "Sao Paulo", state: "MG", postalCode: "35610-000", country: "Brazil", longitude: nil, latitude: nil, phone: "(37) 3551-1513", websiteURL: "www.site.com.br", updatedAt: "2022-05-01", createdAt: "2022-05-01")

    static var previews: some View {
        DetailsView(brewery: brewery)
    }
}
