//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 지희의 MAC on 2023/03/16.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
