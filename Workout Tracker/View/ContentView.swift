//
//  ContentView.swift
//  Workout Tracker
//
//  Created by Haris Alicic on 23. 1. 2025..
//

import SwiftUI

struct ContentView: View {
    @StateObject var workoutTemplateViewModel: WorkoutTemplateViewModel = WorkoutTemplateViewModel()
    
    private let workouts = [
        WorkoutTemplate(id: UUID(), name: "Push", exercises: [ExerciseTemplate(id: UUID(), name: "Bench")])
    ]
    
    var body: some View {
        VStack {
            NavigationView{
                List {
                    ForEach(workoutTemplateViewModel.workoutTemplates) { workoutTemplate in
                        NavigationLink {
                            WorkoutView(workoutTemplate: workoutTemplate)
                        } label: {
                            HStack{
                                Text("\(workoutTemplate.name)")
                                    .font(.system(size: 18, weight: .regular, design: .default))
                            }

                        }
                        
                    }
                }
                .navigationTitle("Workouts")
                .toolbar {
                    NavigationLink {
                        CreateWorkoutTemplate(workoutTemplateViewModel: workoutTemplateViewModel)
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WorkoutTemplateViewModel())
}
