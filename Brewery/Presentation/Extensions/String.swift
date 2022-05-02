//
//  String.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 02/05/22.
//

import Foundation

extension String {
    func getFirstLetter() -> String {
        let letters = Array(self)
        return String(letters[0]).lowercased()
    }
}
