//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Liko Setiawan on 27/04/24.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(Favorites.self) var favorites
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomTrailing){
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                    
                    Text("Credit by : \(resort.imageCredit)")
                        .font(.caption.bold())
                        .foregroundColor(.white) // Assuming text color should contrast with the image
                        .padding(8) // Add some padding around the text for better visibility
                        .background(Color.black.opacity(0.5)) // Semi-transparent background for better text readability
                        .clipShape(RoundedRectangle(cornerRadius: 8)) // Optional: Add rounded corners for a nicer look
                    
                }
                
                HStack {
                    if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                        VStack(spacing: 10) {
                            ResortDetailsView(resort: resort)
                            
                        }
                        VStack(spacing: 10) {
                            SkiDetailsView(resort: resort)
                            
                        }
                    } else {
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    HStack{
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacility = facility
                                showingFacility = true
                            } label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                
                Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                    if favorites.contains(resort) {
                        favorites.remove(resort)
                    } else {
                        favorites.add(resort)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
            }
            
            
            
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More Information", isPresented: $showingFacility, presenting: selectedFacility) { _ in
            
        } message: { facility in
            Text(facility.description)
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
}

#Preview {
    ResortView(resort: .example)
        .environment(Favorites())
}
