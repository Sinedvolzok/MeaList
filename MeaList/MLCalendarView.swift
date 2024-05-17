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
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading) {
                ForEach(weeks) { week in
                    Section(header: Text(week.title).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)) {
                        ForEach(week.getWeekdays()) { day in
                            Text(day.title)
                        }
                        Text("Shopping Bag")
                    }
                }
            }
        }.safeAreaPadding()
    }
}

#Preview {
    MLCalendarView()
}
