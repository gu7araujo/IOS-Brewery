//
//  SwiftUIView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 28/04/22.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color("Yellow"), location: 0.3),
                    .init(color: Color("WhiteBackground"), location: 0.3)
                ], center: .top, startRadius: geometry.size.height * 0.1, endRadius: geometry.size.height * 1)
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "g.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80.0, height: 80.0)
                            .foregroundStyle(.brown, Color("Orange"))

                        Spacer()

                        VStack {
                            Text("Cervejaria C")
                                .font(.headline)
                            EvaluationScoring()
                            Text("+500 avaliacoes")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 30)

                    HStack {
                        Text("Tipo")
                        Spacer()
                        Text("Bar")
                    }
                    .padding(.bottom, 15)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)


                    HStack {
                        Text("Site")
                        Spacer()
                        Text("www.Bar.com")
                    }
                    .padding(.bottom, 15)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)


                    HStack {
                        Text("Endereco")
                        Spacer()
                        Text("618 Farb Ave, San Diego")
                    }
                    .padding(.bottom, 15)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)

                    Button {
                        //
                    } label: {
                        Text("Avaliar Cervejaria")
                    }
                    .padding(10)
                    .padding(.horizontal, 30)
                    .foregroundColor(.black)
                    .background(Color("Yellow"))
                    .cornerRadius(5)
                    .padding(30)
                }
                .frame(width: geometry.size.width * 0.8)
                .padding()
                .background(.white)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
