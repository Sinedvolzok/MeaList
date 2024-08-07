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
    @State private var selectedMealId : String?
    @State private var isScrollDisabled: Bool = false
    
    var body: some View {
        ZStack {
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
                                            Button {
                                                selectedDayId = date.id
                                                isAddMealTapped = true
                                            } label: {
                                                MLMealPlaceholder()
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
                .scrollDisabled(isAddMealTapped)
                .safeAreaPadding()
            }
            .blur(radius: isAddMealTapped ? 3:0)
            AddingMealView(days: $days, 
                           isLeaveView: $isAddMealTapped,
                           selectedId: $selectedDayId)
            .opacity(isAddMealTapped ? 1:0)
        }
    }
}

// MARK: - TitleView
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

#Preview {
    MLCalendarView()
}
