//
//  SandwichGallary.swift
//  Sandwich
//
//  Created by Toseef on 8/3/21.
//

import SwiftUI

struct SandwichGallary: View {
    var store: SandwichStore

    var coloumn = [
        GridItem(spacing: 0),
        GridItem(spacing: 0)
    ]
    var body: some View {

        NavigationView {
            ScrollView {
                LazyVGrid(columns: coloumn, spacing: 8) {
                    ForEach(store.sandwiches) { sandwich in
                        HeroView(sandwich: sandwich)
                    }
                }
            }
            .navigationTitle("Gallery")
        }
    }
}

struct SandwichGallary_Previews: PreviewProvider {
    static var previews: some View {
        SandwichGallary(store: testStore)
    }
}

struct HeroView: View {
   @State var sandwich: Sandwich
    var body: some View {
        NavigationLink(
            destination: SandwichDetail(sandwich: $sandwich)) {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom), content: {
            Image(sandwich.imageName)
                .resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
            BannerView(sandwich: sandwich)
        })
        }
    }
}

struct BannerView: View {
    var sandwich: Sandwich

    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text(sandwich.name)
                .font(.title2)
                .foregroundColor(.white)
            RatingView(rating: sandwich.ingrediantCount)
        }
        .frame(minWidth: 0, maxWidth: 200)
        .background(Color( white: 0.2, opacity: 0.5))
    }
}


struct RatingView: View {
    var rating: Int

    var body: some View {
        HStack {
            ForEach(0..<5) { starIndex in
                Image(systemName: rating > starIndex ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
    }
}
