//
//  Workout_TrackerApp.swift
//  Workout Tracker
//
//  Created by Haris Alicic on 23. 1. 2025..
//

import SwiftUI

@main
struct Workout_TrackerApp: App {
    @StateObject private var workoutTemplateViewModel: WorkoutTemplateViewModel = WorkoutTemplateViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(workoutTemplateViewModel)
        }
    }
}
