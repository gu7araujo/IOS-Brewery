//
//  Brewery.swift
//  Domain
//
//  Created by Gustavo Araujo Santos on 09/04/22.
//

import Foundation

public struct Brewery: Decodable {
    public let id, name, breweryType: String
    public let street: String?
    public let city, state, postalCode, country: String
    public let longitude, latitude, phone: String?
    public let websiteURL: String?
    public let updatedAt, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case breweryType = "brewery_type"
        case street, city, state
        case postalCode = "postal_code"
        case country, longitude, latitude, phone
        case websiteURL = "website_url"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
    }
}
