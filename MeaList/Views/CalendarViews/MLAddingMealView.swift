//
//  MLAddingMealView.swift
//  MeaList
//
//  Created by Denis Kozlov on 06.08.2024.
//

import SwiftUI

struct MLAddingMealView: View {
    @Environment(\.calendarEnvironmentValue) private var calendar
    var isEdit: Bool
    @State private var dishName: String = ""
    @State private var selectedMealType: MLMealType = .dinner
    
    var body: some View {
        VStack(alignment: .leading) {
            GroupBox(label: Text(isEdit ? "Editing meal..." : "Adding meal...")
                .font(.title3)
                .padding(.bottom)
                .foregroundStyle(.primary)) {
                TextField("Type dish name...", text: $dishName)
                VStack(spacing: 8) {
                    // MARK: Picker
                    Picker("Pick meal time", selection: $selectedMealType) {
                        ForEach(MLMealType.allCases) { mealType in
                            Image(systemName: mealType.image).tag(mealType)
                        }
                    }.padding(.top)
                    .pickerStyle(.segmented)
                    // MARK: Picker describe
                    HStack {
                        ForEach(MLMealType.allCases) { mealType in
                            Spacer()
                            Text(mealType.rawValue)
                                .font(.caption)
                                .foregroundColor(selectedMealType == mealType ? .primary : .secondary)
                            Spacer()
                        }
                    }
                    // MARK: Buttons
                    HStack {
                        Button {
                            dishName = ""
                            calendar.state = .viewing
                            calendar.selectedMeal = nil
                        } label: {
                            Text("Cancel")
                                .padding(12)
                                .background(Color(
                                    UIColor.secondarySystemBackground))
                                .foregroundColor(.secondary)
                                .cornerRadius(16)
                        }
                        Spacer()
                        Button {
                            if isEdit {
                                guard let selectedMeal = calendar.selectedMeal else { return }
                                calendar.edit(selectedMeal, with: (selectedMealType, dishName))
                            } else {
                                guard let selectedDay = calendar.selectedDay else { return }
                                calendar.add(to: selectedDay, with: (selectedMealType, dishName))
                            }
                            dishName = ""
                            calendar.state = .viewing
                            calendar.selectedMeal = nil
                        } label: {
                            Label(isEdit ? "Done":"Add meal",
                                  systemImage: isEdit ? "checkmark":"plus")
                                .font(.headline)
                                .padding(10)
                                .foregroundColor(Color(
                                    UIColor.tertiarySystemBackground))
                                .background(.primary)
                                .cornerRadius(16)
                        }
                    }.padding(.top)
                }
            }.groupBoxStyle(.meal)
        }
        .onAppear {
            dishName = calendar.selectedMeal?.dish.title ?? ""
            selectedMealType = calendar.selectedMeal?.type ?? .dinner
        }
        .frame(maxWidth: 320)
        .safeAreaPadding()
        .background(Color(uiColor: .secondarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
        .shadow(radius: 12, y: 8)
    }
}

#Preview {
    MLAddingMealView(isEdit: true)
}
