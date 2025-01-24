//
//  Workout.swift
//  Workout Tracker
//
//  Created by Haris Alicic on 23. 1. 2025..
//

import Foundation

struct Workout: Identifiable {
    let id: UUID
    let name: String
    var exercises: [Exercise]
    let date: Date
}

struct Exercise: Identifiable {
    let id: UUID
    let name: String
    var sets: [Set] = []
}

struct Set: Identifiable {
    let id: UUID
    var reps: Int = 0
    var weight: Double = 0.0
}
