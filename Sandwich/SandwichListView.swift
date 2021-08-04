//
//  ContentView.swift
//  Sandwich
//
//  Created by Toseef on 7/30/21.
//

import SwiftUI

struct SandwichListView: View {
    @ObservedObject var store: SandwichStore
    var body: some View {

        NavigationView {
            List {
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleteSandwiches)

                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: makeSandwich, label: {
                                    Image(systemName: "plus")
                                })
            )

            .navigationTitle("Sandwiches")

            Text("Select a Sandwich")
                .font(.largeTitle)
        }
    }


    func makeSandwich() {
        let number = Int.random(in: 0...6)

        withAnimation {
            store.sandwiches.append(Sandwich(name: "Sandwich \(store.sandwiches.count + 1)", ingrediantCount: 4, imageName: "Sandwich_\(number)"))
        }
    }

    func moveSandwiches(from: IndexSet, to: Int)  {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }

    func deleteSandwiches(offsets: IndexSet)  {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }

}

struct SandwichListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SandwichListView(store: testStore)
            SandwichListView(store: testStore)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}

struct SandwichCell: View {
    @State var sandwich: Sandwich

    var body: some View {
        NavigationLink(
            destination: SandwichDetail(sandwich: $sandwich)) {
            Image(sandwich.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(sandwich.isSpicy ? sandwich.name + "🌶" : sandwich.name)

                Text("\(sandwich.ingrediantCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            if sandwich.isFavourite {
                Spacer()
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.pink)
            }
        }
    }
}
