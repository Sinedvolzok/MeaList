//
//  MLCalendarView.swift
//  MeaList
//
//  Created by Denis Kozlov on 17.05.2024.
//

import SwiftUI

struct MLCalendarView: View {
    let weeks: [MLWeek] = MLWeek.getWeeks()
    let columns = [GridItem(.adaptive(minimum: 320))]
    let currentWeek: String = MLWeek.getCurrentWeek()
    
    @State private var days: Set<MLDay> = []
    @State private var isAddMealTapped: Bool = false
    @State private var selectedDayId : String?
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(weeks) { week in
                        Section(header: TitleView(week: week)) {
                            let dates = week.getWeekdays()
                            ForEach(dates) { date in
                                GroupBox(label: DateLabel(weekday: date.weekday, day: date.day)) {
                                    if let day = days.first(where: {$0.isOn(this: date)}) {
                                        MLDayView(day: day,
                                                  days: $days,
                                                  isAddMealTapped: $isAddMealTapped,
                                                  selectedDayId: $selectedDayId)
                                    } else {
                                        if isAddMealTapped && selectedDayId == date.id {
                                            AddingMealView(days: $days, isLeaveView: $isAddMealTapped, selectedId: $selectedDayId)
                                        } else {
                                            Button {
                                                selectedDayId = date.id
                                                isAddMealTapped = true
                                            } label: {
                                                MLMealPlaceholder()
                                            }
                                        }
                                    }
                                }.groupBoxStyle(DayGroupBoxStyle())
                            }
                        }
                    }
                }
            }
            .onAppear {
                proxy.scrollTo(currentWeek)
            }
            .safeAreaPadding()
        }
    }
}

#Preview {
    MLCalendarView()
}

struct MLDayView: View {
    let day: MLDay
    @Binding var days: Set<MLDay>
    @Binding var isAddMealTapped: Bool
    @Binding var selectedDayId : String?
    var body: some View {
        VStack {
            ForEach(MLMealType.allCases) { mealType in
                if Set(day.meals.map(\.type)).contains(mealType) {
                    GroupBox(label: Text(mealType.rawValue)) {
                        ForEach(day.meals) { meal in
                            HStack {
                                if meal.type == mealType {
                                    Text(meal.dish.title).padding(8)
                                    Spacer()
                                }
                            }
                        }
                    }.groupBoxStyle(.meal)
                }
            }
            if isAddMealTapped && selectedDayId == day.id {
                AddingMealView(days: $days, isLeaveView: $isAddMealTapped, selectedId: $selectedDayId)
            } else {
                AddMealButton(day: day, tapped: $isAddMealTapped, selectedDayId: $selectedDayId)
            }
        }
    }
}

struct AddMealButton: View {
    let day: MLDay
    @Binding var tapped: Bool
    @Binding var selectedDayId : String?
    var body: some View {
        Button {
            tapped = true
            selectedDayId = day.id
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

struct TitleView: View {
    var week: MLWeek
    var body: some View {
        Text(week.title)
            .font(.title)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding()
            .padding(.top, 60)
    }
}
