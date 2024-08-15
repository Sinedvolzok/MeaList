//
//  MLCalendarView.swift
//  MeaList
//
//  Created by Denis Kozlov on 17.05.2024.
//

import SwiftUI



struct MLCalendarView: View {
    @Environment(\.calendarEnvironmentValue) private var calendar
    
    let weeks: [MLWeek] = MLWeek.getWeeks()
    let columns = [GridItem(.adaptive(minimum: 320))]
    let currentWeek: String = MLWeek.getCurrentWeek()
    
    var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(weeks) { week in
                            Section(header: TitleView(week: week)) {
                                let dates = week.getWeekdays()
                                ForEach(dates) { date in
                                    GroupBox(label: MLDateLabel(weekday: date.weekday, day: date.day)) {
                                        if let day = calendar.days.first(where: {$0.isOn(this: date)}) {
                                            MLDayView(day: day)
                                        } else {
                                            Button {
                                                calendar.selectedDay = MLDay(date: date)
                                                calendar.state = .adding
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
                .scrollDisabled(calendar.state != .viewing)
                .safeAreaPadding()
            }
            .blur(radius: calendar.state != .viewing ? 3:0)
            VStack {
                switch calendar.state {
                case .adding:
                    MLAddingMealView(isEdit: false)
                case .editing:
                    MLAddingMealView(isEdit: true)
                case .viewing:
                    EmptyView()
                case .deleting:
                    EmptyView()
                }
            }
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
        .environment(\.calendarEnvironmentValue, MLCalendar())
}
