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
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(weeks) { week in
                        Section(header:
                            Text(week.title)
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                                .padding(.top, 60)) {
                            let days = week.getWeekdays()
                            ForEach(days) { day in
                                let meals = day.getMeals(from: MLMeal.mockedData2)
                                GroupBox(label: DateLabel(weekday: day.date.weekday, day: day.title)) {
                                    if meals.isEmpty {
                                        MLMealPlaceholder()
                                    } else {
                                        ForEach(meals) { meal in
                                            MLMealView(meal: meal)
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

struct MLMealView: View {
    let meal: MLMeal
    let dishes = ["Broccly", "Soup"]
    var body: some View {
        GroupBox(label: Text(meal.type.rawValue)){
            //    let dishes = meal.getDishes(from: //MLDish.mockedData)
            ForEach(dishes, id: \.self) { dish in
                Text(dish)
                if dish != dishes.last {
                    Divider()
                }
            }
        }.groupBoxStyle(MealGroupBoxStyle())
    }
}
