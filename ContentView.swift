//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Liko Setiawan on 27/04/24.
//

import SwiftUI


struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var searchText = ""
    
    @State private var favorites = Favorites()
    
    var filteredResort: [Resort] {
        if searchText.isEmpty {
            resorts
        } else {
            resorts.filter { $0.name.localizedStandardContains(searchText)}
        }
    }
    
    var sortedResorts: [Resort] {
        switch sortType {
        case .default:
            filteredResort
        case .alphabetical:
            filteredResort.sorted { $0.name < $1.name }
        case .country:
            filteredResort.sorted { $0.country < $1.country }
        }
    }
    
    enum sort {
        case `default`, alphabetical, country
    }
    @State private var sortType = sort.default
    @State private var isShowingOtherType = false
    
    var body: some View {
        NavigationSplitView {
            List(sortedResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("this is a favorite resort")
                                .foregroundStyle(.red)
                        }
                        
                    }
                }
               
            }
            .navigationTitle("Resort")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a place")
            .toolbar {
                Button("Change sort order", systemImage: "arrow.up.arrow.down") {
                    isShowingOtherType = true
                }
            }
            .confirmationDialog("Sort Order", isPresented: $isShowingOtherType) {
                Button("Default") { sortType = .default }
                Button("Alphabetical") { sortType = .alphabetical}
                Button("By Country") { sortType = .country }
            }
            
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
        
    }
}
    
    #Preview {
        ContentView()
    }
