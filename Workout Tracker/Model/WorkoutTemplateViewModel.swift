//
//  WorkoutViewModel.swift
//  Workout Tracker
//
//  Created by Haris Alicic on 23. 1. 2025..
//

import Foundation

class WorkoutTemplateViewModel: ObservableObject {
    @Published var workoutTemplates: [WorkoutTemplate]
    
    init() {
        self.workoutTemplates = [WorkoutTemplate(id: UUID(), name: "Push", exercises: [ExerciseTemplate(id: UUID(), name: "Bench")]),
                                 WorkoutTemplate(id: UUID(), name: "Pull", exercises: [ExerciseTemplate(id: UUID(), name: "Pull up")]),
                                 WorkoutTemplate(id: UUID(), name: "Legs", exercises: [ExerciseTemplate(id: UUID(), name: "Squat")])
        ]
    }
    
    func createWorkoutTemplate(name: String, exerciseNames: [String]) {
        let exercises: [ExerciseTemplate] = exerciseNames.map {ExerciseTemplate(id: UUID(), name: $0)}
        let workoutTemplate = WorkoutTemplate(id: UUID(), name: name, exercises: exercises)
        
        self.workoutTemplates.append(workoutTemplate)
    }
}
