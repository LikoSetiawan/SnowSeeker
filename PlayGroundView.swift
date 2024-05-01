//
//  PlayGroundView.swift
//  SnowSeeker
//
//  Created by Liko Setiawan on 28/04/24.
//

import SwiftUI

struct PlayGroundView: View {
    
    enum sort {
        case a, b, c
    }
    
    var body: some View {
        VStack() {
            Text("red")
                .onTapGesture {
                    print("tapped")
                }
            
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    PlayGroundView()
}
