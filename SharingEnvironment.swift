//
//  SharingEnvironment.swift
//  SnowSeeker
//
//  Created by Liko Setiawan on 27/04/24.
//

import SwiftUI

@Observable
class Player {
    var name = "Liko"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player
    
    var body: some View {
        @Bindable var player = player
        
        Stepper("Your high scroe: \(player.highScore)", value: $player.highScore)
    }
}


struct SharingEnvironment: View {
    @State private var player = Player()
    
    
    var body: some View {
        VStack{
            Text("Welcome!")
            HighScoreView()
        }
        .environment(player)
    }
}

#Preview {
    SharingEnvironment()
}
