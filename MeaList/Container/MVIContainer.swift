//
//  MLMVIContainer.swift
//  MeaList
//
//  Created by Denis Kozlov on 17.07.2024.
//

import Foundation
import SwiftUI

final class AppState {
    
    var model: AppModel
    let intent: AppIntent
    
    var stateWillChange: (() -> Void)?
    var stateDidChange:  (() -> Void)?
    
    init(intent: AppIntent, model: AppModel) {
        self.intent = intent
        self.model = model
    }
    
    func execute(action: AppIntent) {
        stateWillChange?()
        model = action.model
        stateDidChange?()
    }
}

protocol AppIntent {
    var model: AppModel { get set }
}

protocol AppModel {
    
}


enum Suit: String, CaseIterable {
    case heards = "heart.fill"
    case diamonds = "diamond.fill"
    case clubs = "cross.fill"
    case spades = "arrowshape.up.fill"
}

struct Model {
    
}

struct SomeView: View {
    @State var suit: String
    @State var value: Int
    var body: some View {
        Label("\(value)", systemImage: suit)
            .padding()
            .foregroundStyle(.red, .primary)
        Button {
            value = Int.random(in: 6..<10)
            suit = Suit.allCases
                .randomElement()!
                .rawValue
        }
        label: {
            Text("Tap to Play")
                .padding()
        }
    }
}

#Preview {
    SomeView(suit: Suit.clubs.rawValue, value: 0)
}

