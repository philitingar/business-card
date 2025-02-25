//
//  ContentView.swift
//  TimeaCarrd
//
//  Created by Timi on 13/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.lightTeal.brightness(-0.4)
                .ignoresSafeArea()
            VStack {
                
                Image("img1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 190, height: 190)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                        )
                
                Text("Hangry Meow")
                    .font(Font.custom("Satisfy-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("Cute Meow that wants to be an iOS dev.")
                    .foregroundColor(Color.lightTeal)
                    .font(Font.custom("Satisfy-Regular", size: 20))
                Divider()
                InfoView(text: "meowtastic@gmail.com", ImageName: "envelope.badge")
                    .foregroundColor(.white)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InfoView: View {
    let text: String
    let ImageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.lightTeal.opacity(0.6))
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: ImageName)
                    .foregroundColor(.white)
                Text(text).bold()
            })
            .padding()
    }
}
