//
//  Rating.swift
//  Domain
//
//  Created by Gustavo Araujo Santos on 20/05/22.
//

import Foundation

public struct Rating: Identifiable {
    public let id: UUID
    public let email: String
    public let rating: Int16
    public let breweryId: String

    public init(email: String,
                rating: Int16,
                breweryId: String) {
        self.id = UUID()
        self.email = email
        self.rating = rating
        self.breweryId = breweryId
    }
}
