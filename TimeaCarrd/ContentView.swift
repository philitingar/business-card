//
//  ContentView.swift
//  TimeaCarrd
//
//  Created by Timi on 13/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var currentImage = "img1" // Track the displayed image
    let moodImages = ["img1", "img2", "img3", "img4", "img5"]
    
    var body: some View {
        ZStack {
            viewModel.themeColor.brightness(-0.4)
                .ignoresSafeArea()
            VStack {
                
                Image(currentImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 190, height: 190)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                

                Text("Cute Meow")
                    .font(Font.custom("Satisfy-Regular", size: 45))
                    .bold()
                    .foregroundColor(.white)
                Text("A curious cat exploring iOS development.")
                    .foregroundColor(viewModel.themeColor)
                    .font(Font.custom("Satisfy-Regular", size: 20))
                Divider()
                InfoView(themeColor: viewModel.themeColor, text: "meowtastic@gmail.com", ImageName: "envelope.badge")
                    .foregroundColor(.white)

                Button("Change Profile Picture") {
                    if let currentIndex = moodImages.firstIndex(of: currentImage) {
                        let nextIndex = (currentIndex + 1) % moodImages.count
                        currentImage = moodImages[nextIndex]
                    }
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .foregroundColor(viewModel.themeColor)
                .cornerRadius(10)
                Button {
                    viewModel.toggleColor()
                } label:{
                    Text("Change My Colors")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.themeColor.opacity(0.6))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .padding()
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
    let themeColor: Color
    let text: String
    let ImageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(themeColor.opacity(0.6))
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: ImageName)
                    .foregroundColor(.white)
                Text(text).bold()
            })
            .padding()
    }
}
