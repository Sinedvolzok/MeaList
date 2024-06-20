//
//  GroupBoxView.swift
//  MeaList
//
//  Created by Denis Kozlov on 21.05.2024.
//

import SwiftUI

struct GroupBoxView: View {
    @State private var days: Set<MLDay> = []
    @State var weekday: String = "WEDNESDAY"
    @State var day: String = "MAY 15"
    @State private var isAddMealTapped: Bool = false
    @State private var selectedDayId: String?
    @State private var isSelected: Bool?
    @State private var selectedId: String?
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init()],spacing: 20) {
                GroupBox(label: DateLabel(weekday: weekday, day: day)) {
                    if isAddMealTapped {
                        AddingMealView(days: $days, isLeaveView: $isAddMealTapped, selectedId: $selectedId)
                    } else {
                        Button {
                            let isSelected = selectedId != day
                            selectedId = isSelected ? day : nil
                            isAddMealTapped = true
                        } label: {
                            MLMealPlaceholder()
                        }
                    }
                    
                }.groupBoxStyle(DayGroupBoxStyle())
            }
        }.safeAreaPadding()
    }
}

struct MockDayView: View {
    let day: MLDay = MLDay(date: .now, meals: MLMeal.mockedData)
    @State var days: Set<MLDay> = [MLDay(date: .now, meals: MLMeal.mockedData)]
    @State var isAddMealTapped: Bool = true
    @State var selectedDayId : String? = "24_06_17"
    let mockDishes = ["Banana","Vanilla","Cooper"]
    var body: some View {
        VStack {
            ForEach(MLMealType.allCases) { mealType in
                if Set(day.meals.map(\.type)).contains(mealType) {
                    GroupBox(label: Text(mealType.rawValue)) {
                        ForEach(day.meals) { meal in
                            HStack {
                                if meal.type == mealType {
                                    Text(meal.dish.title).padding()
                                    Spacer()
                                }
                            }
                        }
                    }.groupBoxStyle(.meal)
                }
            }
            //ForEach(day.meals) { meal in
            //    GroupBox(label: Text(meal.type.rawValue)){
            //        let dishes = meal.dishes
            //        ForEach(dishes) { dish in
            //            HStack {
            //                Text(dish.title)
            //                Spacer()
            //            }
            //        }
            //    }.groupBoxStyle(MealGroupBoxStyle())
            //}
            AddMealButton(day: day, tapped: $isAddMealTapped, selectedDayId: $selectedDayId)
        }
    }
}

struct AddingMealView: View {
    @Binding var days: Set<MLDay>
    @Binding var isLeaveView: Bool
    @Binding var selectedId : String?
    @State private var dishName: String = ""
    @State private var selectedMealType: MLMealType = .dinner
    
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
                        isLeaveView = false
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
                        guard let id = selectedId 
                        else { return }
                        
                        let dish = MLDish(title: dishName)
                        let meal = MLMeal(dateId: id, 
                                          type: selectedMealType,
                                          dish: dish)
                        
                        guard let date = MLDateFormatter.shared.getDate(from: id)
                        else { return }
                        
                        if let existDay = days.first(where: {$0.date.id == date.id}) {
                            existDay.meals.append(meal)
                        } else {
                            let day = MLDay(date: date)
                            day.meals.append(meal)
                            days.insert(day)
                        }
                        print(id)
                        isLeaveView = false
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
// MARK: - Styles

extension GroupBoxStyle where Self == MealGroupBoxStyle {
    static var meal: Self { Self() }
}

extension GroupBoxStyle where Self == DayGroupBoxStyle {
    static var day: Self { Self() }
}

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
    MockDayView()
}
