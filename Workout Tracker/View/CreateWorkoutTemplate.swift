//
//  CreateWorkoutTemplate.swift
//  Workout Tracker
//
//  Created by Haris Alicic on 23. 1. 2025..
//

import SwiftUI

struct CreateWorkoutTemplate: View {
    @StateObject var workoutTemplateViewModel: WorkoutTemplateViewModel
    @State private var textFields: [String] = []
    @State private var workoutName: String = ""
    @FocusState private var workoutNameIsFocused: Bool
    
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack {
                TextField("Workout name", text: $workoutName)
                    .focused($workoutNameIsFocused)
                    .disableAutocorrection(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                ForEach(0..<textFields.count, id: \.self) {index in
                    TextField("Exercise \(index + 1)", text: Binding(
                        get: { textFields[index] },
                        set: { textFields[index] = $0 }
                    ))
                    .disableAutocorrection(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                HStack {
                    Button(action: {
                        textFields.append("")
                    }) {
                        Text("Add TextField")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        print("Text fields: \(textFields)")
                        workoutTemplateViewModel.createWorkoutTemplate(name: workoutName, exerciseNames: textFields)
                        
                    }) {
                        Text("Create workout")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CreateWorkoutTemplate(workoutTemplateViewModel: WorkoutTemplateViewModel())
}
