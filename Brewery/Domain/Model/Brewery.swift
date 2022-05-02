//
//  Brewery.swift
//  Domain
//
//  Created by Gustavo Araujo Santos on 09/04/22.
//

public struct Brewery: Decodable {
    public let id, name, breweryType: String
    public let street: String?
    public let city, state, postalCode, country: String?
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

    public init(id: String,
                name: String,
                breweryType: String,
                street: String?,
                city: String?,
                state: String?,
                postalCode: String?,
                country: String?,
                longitude: String?,
                latitude: String?,
                phone: String?,
                websiteURL: String?,
                updatedAt: String,
                createdAt: String) {
        self.id = id
        self.name = name
        self.breweryType = breweryType
        self.street = street
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
        self.longitude = longitude
        self.latitude = latitude
        self.phone = phone
        self.websiteURL = websiteURL
        self.updatedAt = updatedAt
        self.createdAt = createdAt
    }
}
