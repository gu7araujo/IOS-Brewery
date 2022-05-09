//
//  Message.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 09/05/22.
//

import SwiftUI

struct Messages: View {
    var title: String
    var message: String

    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.semibold)
                .font(.title)

            Text(message)
                .font(.subheadline)
        }
    }
}
