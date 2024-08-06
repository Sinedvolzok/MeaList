//
//  MLMealPlaceholder.swift
//  MeaList
//
//  Created by Denis Kozlov on 06.08.2024.
//

import SwiftUI

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

#Preview {
    MLMealPlaceholder()
}
