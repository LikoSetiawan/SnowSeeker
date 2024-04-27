//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Liko Setiawan on 27/04/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            Text("Welcome to Snow Seeker")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
