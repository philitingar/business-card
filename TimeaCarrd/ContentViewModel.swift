//
//  ContentViewModel.swift
//  TimeaCarrd
//
//  Created by Timea Bartha on 25/2/25.
//

import SwiftUI


class ContentViewModel: ObservableObject {
    @Published var themeColor: Color = Color.lightTeal
    
    func toggleColor() {
        themeColor = (themeColor == Color.lightTeal) ? Color.lightBlue : Color.lightTeal
    }
}
