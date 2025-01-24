//
//  WorkoutView.swift
//  Workout Tracker
//
//  Created by Haris Alicic on 23. 1. 2025..
//

import SwiftUI

struct WorkoutView: View {
    let workoutTemplate: WorkoutTemplate
    @State private var workout: Workout
    
    var workoutExercises: [Exercise] = []
    init (workoutTemplate: WorkoutTemplate) {
        self.workoutTemplate = workoutTemplate
        self.workoutExercises = workoutTemplate.exercises.map {Exercise(id: UUID(), name: $0.name)}
        self.workout = Workout(id: UUID(), name: workoutTemplate.name, exercises: workoutExercises, date: Date())
    }
    
    var body: some View {
        VStack {
            
            
            NavigationView {
                List {
                    ForEach($workout.exercises, id: \.id) { $exercise in
                        ExerciseSection(exercise: $exercise)
                    }
                }
                .navigationTitle(workout.name)
            }
            Spacer()
            Button(action: {
                print("Action")
            }) {
                Text("Start workout")
            }
        }
    }
}

struct ExerciseSection: View {
    @Binding var exercise: Exercise
    
    var body: some View {
        Section(header: Text(exercise.name)) {
            ForEach($exercise.sets, id: \.id) { $set in
                SetRow(set: $set, onRemove: {
                    removeSet(set: set)
                })
            }
            Button(action: {
                exercise.sets.append(Set(id: UUID(), reps: 0, weight: 0.0))
            }) {
                Label("Add Set", systemImage: "plus.circle")
                    .font(.subheadline)
            }
        }
    }
    
    private func removeSet(set: Set) {
        if let index = exercise.sets.firstIndex(where: {$0.id == set.id}) {
            exercise.sets.remove(at: index)
        }
    }
}

struct SetRow: View {
    @Binding var set: Set
    var onRemove: () -> Void
    
    var body: some View {
        HStack {
            TextField("Reps", value: $set.reps, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .frame(width: 60)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Weight", value: $set.weight, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
                .frame(width: 80)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            Button(action: {
                self.onRemove()
            }) {
                Image(systemName: "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color.black)
            }

        }
    }
}

//#Preview {
//    WorkoutView(workoutTemplate: WorkoutTemplate(id: UUID(), name: "Push", exercises: [ExerciseTemplate(id: UUID(), name: "Exercise")]))
//}
