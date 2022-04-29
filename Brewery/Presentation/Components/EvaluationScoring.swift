//
//  EvaluationScoring.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 28/04/22.
//

import SwiftUI

struct EvaluationScoring: View {
    var body: some View {
        ZStack {
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
        }
    }
}
