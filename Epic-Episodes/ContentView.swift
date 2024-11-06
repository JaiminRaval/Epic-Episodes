//
//  ContentView.swift
//  Epic-Episodes
//
//  Created by Jaimin Raval on 29/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var episodes: [Episode] = MockData.episodes
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($episodes) { episode in
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
                .onMove{ indexSet, destination in
                    episodes.move(fromOffsets: indexSet, toOffset: destination)
                    var cntr = 0
                    for episode in episodes{
                        episode.listOrder = cntr
                        cntr += 1
                        print("\(episode.title), list order: \(episode.listOrder)")
                    }
                    print("/-/-/-/-/-/-/")
                }
                .navigationTitle("Episodes")
                
            }
        }
    }
}

#Preview {
    ContentView()
}
