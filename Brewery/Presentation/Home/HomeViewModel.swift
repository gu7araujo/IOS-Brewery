//
//  HomeViewModel.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 10/04/22.
//

import Application
import Domain
import Foundation
import SwiftUI

extension HomeView {
    @MainActor class HomeViewModel: ObservableObject {
        @Published var searchText = ""
        @Published var searchResult = [Brewery]()
        @Published var showingResult = false

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
                    showingResult(true)
                case .failure(let error):
                    handleError(error)
                }
            }
        }

        func searchEmpty() {
            searchResult = []
            showingResult(false)
            messageTitle = "Nenhum termo digitado"
            messageBody = "Por favor, verifique sua pesquisa e tente novamente para obter resultados"
        }

        private func handleError(_ error: Error) {
            searchResult = []
            showingResult(false)
            messageTitle = "Ops.."
            if let error = error as? ProjectError {
                messageBody = error.errorDescription ?? error.localizedDescription
            } else {
                messageBody = error.localizedDescription
            }
        }

        private func showingResult(_ value: Bool) {
            withAnimation {
                showingResult = value
            }
        }

    }
}
