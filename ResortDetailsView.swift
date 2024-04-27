//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Liko Setiawan on 27/04/24.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    
    var size: String {
        switch resort.size {
        case 1: "Small"
        case 2 : "Average"
        default: "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        Group {
            VStack{
                Text("Price")
                    .font(.caption.bold())
                Text(price)
                    .font(.title3)
            }
            
            VStack{
                Text("Size")
                    .font(.caption.bold())
                Text(size)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}
