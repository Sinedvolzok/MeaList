//
//  MeaListApp.swift
//  MeaList
//
//  Created by Denis Kozlov on 03.05.2024.
//

import SwiftUI
import SwiftData
import Observation

@main
struct MeaListApp: App {
    @State private var calendarModel = MLCalendar()
   
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            MLCalendarView()
                .environment(\.calendarEnvironmentValue, calendarModel)
        }
        //.modelContainer(sharedModelContainer)
    }
}
