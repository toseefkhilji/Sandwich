//
//  SandwichDetail.swift
//  Sandwich
//
//  Created by Toseef on 7/30/21.
//

import SwiftUI

struct SandwichDetail: View {
    @Binding var sandwich: Sandwich
    @State private var zoomed = false

    var body: some View {

        VStack(spacing: 8) {
                Spacer(minLength: 0)
                Image(sandwich.imageName)
                    .resizable()
                    .aspectRatio(contentMode: zoomed ? .fill : .fit)
                    .onTapGesture {
                        withAnimation {
                            zoomed.toggle()
                        }
                    }
                Spacer(minLength: 0)


                if !zoomed {
                    Button(action: {
                        sandwich.isFavourite.toggle()
                    }, label: {
                        HStack {
                            Spacer()
                            Image(systemName: sandwich.isFavourite ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.pink)
                                .padding()
                                .background(Color(white: 0.2, opacity: 0.2))
                                .clipShape(Circle())
                        }
                        .padding(16)
                        .transition(.move(edge: .trailing))
                    })
                }
            Spacer(minLength: 0)

                if sandwich.isSpicy && !zoomed {
                    HStack {
                        Spacer()
                        Label("Spicy", systemImage: "flame.fill")
                        Spacer()
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .font(Font.headline.smallCaps())
                    .background(Color.red)
                    .foregroundColor(.yellow)
                    .transition(.move(edge: .bottom))
                }
            }
        .navigationTitle(sandwich.name)
        .edgesIgnoringSafeArea(.bottom)

    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SandwichDetail(sandwich: .constant(testSandwiches[3]))
        }
    }
}
