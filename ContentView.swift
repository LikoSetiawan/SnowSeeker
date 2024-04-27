//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Liko Setiawan on 27/04/24.
//

import SwiftUI


struct ContentView: View {
   
    
    var body: some View {
        Button("tap me ") {
            selectedUser = User()
            isShowingUser = true
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
        }
        .alert("welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
            Button(user.id) { }
        }
    }
}
    
    #Preview {
        ContentView()
    }
