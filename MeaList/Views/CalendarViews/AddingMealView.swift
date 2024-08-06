//
//  AddingMealView.swift
//  MeaList
//
//  Created by Denis Kozlov on 06.08.2024.
//

import SwiftUI

struct AddingMealView: View {
    @Environment(\.calendarEnvironmentValue) private var calendar
    @Binding var isLeaveView: Bool
    @Binding var selectedId: String?
    @State private var dishName: String = ""
    @State private var selectedMealType: MLMealType = .dinner
    
    var body: some View {
        VStack(alignment: .leading) {
            GroupBox(label: Text("Adding meal...")
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
                            isLeaveView = false
                            dishName = ""
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
                            calendar.add(dayId: selectedId, with: (selectedMealType, dishName))
                            isLeaveView = false
                            dishName = ""
                        } label: {
                            Label("Add meal", systemImage: "plus")
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
        .frame(maxWidth: 320)
        .safeAreaPadding()
        .background(Color(uiColor: .secondarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
        .shadow(radius: 12, y: 8)
    }
}

#Preview {
    AddingMealView(isLeaveView: .constant(true), selectedId: .constant(nil))
}
