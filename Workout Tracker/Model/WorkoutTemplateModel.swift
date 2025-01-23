//
//  WorkoutModel.swift
//  Workout Tracker
//
//  Created by Haris Alicic on 23. 1. 2025..
//

import Foundation

struct WorkoutTemplate: Identifiable {
    let id: UUID
    let name: String;
    let exercises: [Exercise]
}

struct Exercise: Identifiable {
    let id: UUID
    let name: String
}
