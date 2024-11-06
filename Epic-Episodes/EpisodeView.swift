//
//  EpisodeView.swift
//  Epic-Episodes
//
//  Created by Jaimin Raval on 06/11/24.
//

import SwiftUI

struct EpisodeView: View {
    @State private var episodes: [Episode] = MockData.episodes
    var body: some View {
        NavigationStack {
            List($episodes, editActions: .move){ episode in
//            List(episodes) { episode in
                HStack(alignment: .top, spacing: 12) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 80, height: 80)
                        .foregroundStyle(episode.color.wrappedValue)
                    
                    VStack(alignment: .leading){
                        Text("Episode Title")
                            .font(.subheadline)
                        
                        Text("Here's some brief details and short description of this perticular episode")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                }
            }
            .navigationTitle("Episodes")
            .onChange(of: episodes) { oldValue, newValue in
                var cntr = 0
                for episode in newValue{
                    episode.listOrder = cntr
                    cntr += 1
                    print("\(episode.title), list order: \(episode.listOrder)")
                }
                print("/-/-/-/-/-/-/")
            }
        }
    }
}

class  Episode : Identifiable, Equatable {

    
    let id = UUID()
    var title: String
    var color: Color
    var listOrder: Int
    
    init(title: String, color: Color, listOrder: Int) {
        self.title = title
        self.color = color
        self.listOrder = listOrder
    }
    
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        lhs.id == rhs.id
    }
}


struct MockData {
    static var episodes: [Episode] {
        [Episode(title: "pink", color: .pink, listOrder: 0),
         Episode(title: "blue", color: .blue, listOrder: 0),
         Episode(title: "teal", color: .teal, listOrder: 0),
         Episode(title: "green", color: .green, listOrder: 0),
         Episode(title: "indigo", color: .indigo, listOrder: 0),
         Episode(title: "purple", color: .purple, listOrder: 0),
         Episode(title: "yellow", color: .yellow, listOrder: 0),
         Episode(title: "red", color: .red, listOrder: 0),
         Episode(title: "orange", color: .orange, listOrder: 0),
         Episode(title: "cyan", color: .cyan, listOrder: 0),
         Episode(title: "gray", color: .gray, listOrder: 0),
         Episode(title: "mint", color: .mint, listOrder: 0),
         Episode(title: "primary", color: .primary, listOrder: 0),
         Episode(title: "secondary", color: .secondary, listOrder: 0),
         Episode(title: "brown", color: .brown, listOrder: 0),
         Episode(title: "black", color: .black, listOrder: 0),
        ]
    }
}



#Preview {
    EpisodeView()
}
