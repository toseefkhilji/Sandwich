//
//  SandwichWidget.swift
//  SandwichWidget
//
//  Created by Toseef on 8/4/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let entry = SimpleEntry(date: Date())
        entries.append(entry)
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct SandwichWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "tray.2.fill")
                    .foregroundColor(.accentColor)
                Text("Sandwich")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                Spacer()
            }
            .padding()
            Spacer()

            HStack (spacing: 8){

                Link(destination: URL(string: "sandwich://list")!, label: {
                    VStack(spacing: 4) {
                        Image(systemName: "square.fill.text.grid.1x2")
                        Text("List").font(.headline)
                    }
                    .foregroundColor(.accentColor)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(white: 0.7, opacity: 0.23))
                    .clipShape(Capsule())
                })


                Link(destination: URL(string: "sandwich://gallery")!, label: {
                    VStack(spacing: 4) {
                        Image(systemName: "square.grid.2x2.fill")
                        Text("Gallery")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(white: 0.7, opacity: 0.23))
                    .clipShape(Capsule())

                })
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(Color("AccentColor"))
    }

}

@main
struct SandwichWidget: Widget {
    let kind: String = "SandwichWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SandwichWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall,.systemMedium])

    }
}

struct SandwichWidget_Previews: PreviewProvider {
    static var previews: some View {
        SandwichWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
