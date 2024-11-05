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
            List(episodes) { episode in
                HStack(alignment: .top, spacing: 12) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 80, height: 80)
                        .foregroundStyle(episode.color)
                    
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
        }
    }
}

struct Episode : Identifiable {
    let id = UUID()
    var title: String
    var color: Color
    var listOrder: Int
    
    init(title: String, color: Color, listOrder: Int) {
        self.title = title
        self.color = color
        self.listOrder = listOrder
    }
}


struct MockData {
    static var episodes: [Episode] {
        [Episode(title: "pink", color: .pink, listOrder: 0),
         Episode(title: "blue", color: .blue, listOrder: 0),
         Episode(title: "pink", color: .teal, listOrder: 0),
         Episode(title: "pink", color: .green, listOrder: 0),
         Episode(title: "pink", color: .indigo, listOrder: 0),
         Episode(title: "pink", color: .purple, listOrder: 0),
         Episode(title: "pink", color: .yellow, listOrder: 0),
         Episode(title: "pink", color: .red, listOrder: 0),
         Episode(title: "pink", color: .orange, listOrder: 0),
         Episode(title: "pink", color: .cyan, listOrder: 0),
         Episode(title: "pink", color: .gray, listOrder: 0),
         Episode(title: "pink", color: .mint, listOrder: 0),
         Episode(title: "pink", color: .primary, listOrder: 0),
         Episode(title: "pink", color: .secondary, listOrder: 0),
         Episode(title: "pink", color: .brown, listOrder: 0),
         Episode(title: "pink", color: .black, listOrder: 0),
        ]
    }
}



#Preview {
    EpisodeView()
}
