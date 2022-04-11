//
//  HomeViewModel.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 10/04/22.
//

import Application
import Domain
import Foundation

extension HomeView {
    @MainActor class HomeViewModel: ObservableObject {
        @Published var searchText = ""
        @Published var searchResult = [Brewery]()

        @Published var messageTitle = ""
        @Published var messageBody = ""


        func onSubmit() {
            guard !searchText.isEmpty else {
                searchEmpty()
                return
            }

            Task {
                let response = await BreweryUseCase.shared.execute(name: searchText)

                switch response {
                case .success(let breweries):
                    searchResult = breweries
                case .failure(let error):
                    handleError(error)
                }
            }
        }


        func searchEmpty() {
            searchResult = []
            messageTitle = "Nenhum termo digitado"
            messageBody = "Por favor, verifique sua pesquisa e tente novamente para obter resultados"
        }

        private func handleError(_ error: Error) {
            messageTitle = "Ops.."
            if let error = error as? ProjectError {
                messageBody = error.errorDescription ?? error.localizedDescription
            } else {
                messageBody = error.localizedDescription
            }
        }

    }
}
