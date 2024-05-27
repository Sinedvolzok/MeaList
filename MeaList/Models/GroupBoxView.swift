//
//  GroupBoxView.swift
//  MeaList
//
//  Created by Denis Kozlov on 21.05.2024.
//

import SwiftUI

struct GroupBoxView: View {
    @State var weekday: String = "WEDNESDAY"
    @State var day: String = "MAY 15"
    @State private var isAddMealTapped: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init()],spacing: 20) {
                ForEach(0..<50) { _ in
                    GroupBox(label: DateLabel(weekday: weekday, day: day)) {
                        GroupBox(label: Text("breakfast")) {
                            Text("Your text rate is 9 BPM. YO YOYO")
                            Divider()
                            Text("Your text rate is 9 BPM.")
                        }.groupBoxStyle(MealGroupBoxStyle())
                        GroupBox(label: Text("dinner")) {
                            Text("Your text rate is 9 BPM. YO YOYO")
                            Divider()
                            Text("Your text rate is 9 BPM.")
                        }.groupBoxStyle(MealGroupBoxStyle())
                        if isAddMealTapped {
                            AddingMealView(tappedCancel: $isAddMealTapped)
                        } else {
                            AddMealButton(tapped: $isAddMealTapped)
                        }
                    }
                    .groupBoxStyle(DayGroupBoxStyle())
                }
            }
        }.safeAreaPadding()
    }
}

struct AddMealButton: View {
    @Binding var tapped: Bool
    var body: some View {
        Button {
            tapped = true
        } label: {
            HStack{
                Label("Add meal...", systemImage: "plus")
                Spacer()
            }
        }
        .padding()
        .foregroundStyle(.secondary)
    }
}

struct AddingMealView: View {
    @State private var dishName: String = ""
    @State private var selectedMealType: MLMealType = .dinner
    @Binding var tappedCancel: Bool
    
   // init() {
   //     UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: //UIColor.label], for: .selected)
   //     UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: //UIColor.secondaryLabel], for: .normal)
   // }
    
    var body: some View {
        GroupBox(label: Text("Adding meal...").padding(.top)) {
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
                        tappedCancel = false
                    } label: {
                        Text("Cancel")
                            .padding(12)
                            .background(Color(
                                UIColor.secondarySystemBackground))
                            .foregroundColor(.secondary)
                            .cornerRadius(16)
                    }
                    Spacer()
                    Label("Add meal", systemImage: "plus")
                        .font(.headline)
                        .padding(10)
                        .foregroundColor(Color(
                            UIColor.tertiarySystemBackground))
                        .background(.primary)
                        .cornerRadius(16)
                }.padding(.top)
            }
        }.groupBoxStyle(MealGroupBoxStyle())
    }
}

struct DateLabel: View {
    var weekday: String
    var day: String
    var body: some View {
        HStack {
            Text(weekday)
                .font(.headline)
            Spacer()
            Text(day)
                .font(.subheadline)
        }
    }
}

struct MLMealPlaceholder: View {
    var body: some View {
        VStack {
            Spacer(minLength: 70)
            HStack {
                Spacer()
                Image(systemName: "fork.knife")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .foregroundColor(.secondary)
                Spacer()
            }
            Spacer(minLength: 80)
        }
        .frame(height: 200)
    }
}

//#Preview {
//    DateLabel()
//}

struct MealGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .padding(.top, 8)
                .foregroundColor(.secondary)
            VStack(alignment: .leading) {
                configuration.content
            }
            .padding()
            .background(
                Color(
                    UIColor.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.secondary, lineWidth: 0.5)
                )
            .shadow(color: .black.opacity(0.1), radius: 8.0, x: 4.0, y: 8.0)
        }
    }
}

struct DayGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .padding(.top)
                .foregroundColor(.secondary)
            VStack(alignment: .leading) {
                configuration.content
            }
            .padding()
            .background(
                Color(
                    UIColor.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        }
        .padding(.leading)
        .padding(.trailing)
    }
}
#Preview {
    //AddingMealView()
    GroupBoxView()
}
