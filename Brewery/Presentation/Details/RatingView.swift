//
//  RatingView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 16/05/22.
//

import SwiftUI
import Domain
import Application

struct RatingView: View {
    let breweryId: String

    @State private var email = ""
    @State private var rating = 2
    @State private var isSuccess = false
    @State private var isError = false

    var body: some View {
        VStack {
            if isError {
                Text("Algo deu errado!")

                Text("Não foi possível adicionar sua avaliação.\nTente mais tarde.")
                    .foregroundColor(.red)
            } else if isSuccess {
                Text("Um brinde!")

                Text("Sua avaliação foi adicionada com sucesso!")
                    .foregroundColor(.green)
            } else {
                Text("Avalie a cervejaria A")

                RatingStar(rating: $rating)

                TextField("nome@email.com", text: $email)

                Button {
                    saveRating()
                } label: {
                    Text("Salvar")
                        .padding(10)
                        .background(.yellow)
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.horizontal)
    }

    private func saveRating() {
        let newRating = Rating(email: email, rating: Int16(rating), breweryId: breweryId)
        let useCase = SaveRatingUseCase()

        let response = useCase.execute(rating: newRating)
        switch response {
        case .success:
            isSuccess = true
        case .failure:
            isError = true
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(breweryId: "aaa")
    }
}
