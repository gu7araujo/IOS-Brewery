//
//  CardBrewery.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 29/04/22.
//

import SwiftUI
import Domain

struct CardBrewery: View {
    var brewery: Brewery

    var body: some View {
        HStack {
            Image(systemName: "\(brewery.name.getFirstLetter()).circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40.0, height: 40.0)
                .foregroundStyle(.brown, Color("Orange"))

            VStack(alignment: .leading) {
                Text(brewery.name)
                    .font(.headline)
                Text("Tipo \(brewery.breweryType)")
            }

            EvaluationScoring()
        }
        .padding(10)
        .background(.white)
        .cornerRadius(15)
        .padding(5)
    }
}
