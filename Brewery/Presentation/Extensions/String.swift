//
//  String.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 02/05/22.
//

import Foundation

// swiftlint:disable identifier_name
extension String {
    func getFirstLetter() -> String {
        let letters = Array(self)
        return String(letters[0]).lowercased()
    }

    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex] + "...")
    }
}
