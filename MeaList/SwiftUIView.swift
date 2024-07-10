//
//  SwiftUIView.swift
//  MeaList
//
//  Created by Denis Kozlov on 02.07.2024.
//

import SwiftUI


struct MyView: View {
    @State var color: Color
    var body: some View {
        VStack {
            ForEach(0..<5) { _ in
                Text("Hello, World!")
                    .frame(height: 50)
                    .foregroundStyle(color)
                    // Use the CustomSwipe gesture on each text view and apply offset modifier
                    .onSwipe {
                        Image(systemName: "globe")
                        Image(systemName: "star")
                    }
            }
        }
    }
}

extension View {
    func onSwipe( @ViewBuilder content: @escaping () -> some View) -> some View {
        modifier(SwipeModifier(actions: content))
    }
}

struct SwipeModifier<Actions: View>: ViewModifier {
    @ViewBuilder var actions: () -> Actions
    @State var offset = CGSize.zero
    @State var actionWidth: CGFloat = 0
    @State var opacity = 0.0
    @State var size = CGSize.zero
    
    func body(content: Content) -> some View {
        HStack {
            content
                .offset(offset)
                .gesture(
                    DragGesture(minimumDistance: 10)
                        .onChanged { value in
                            offset = CGSize(width: value.translation.width,
                                        height: 0)
                            if offset.width < 0 {
                                actionWidth = abs(offset.width/3)
                                opacity = abs(offset.width/100)
                            } else {
                                actionWidth -= offset.width/12
                                opacity -= offset.width/400
                            }
                        }
                        .onEnded{ _ in
                            withAnimation {
                             if offset.width < 0 {
                                actionWidth = 48
                                opacity = 1.0
                             } else {
                                actionWidth = 0
                                opacity = 0.0
                             }
                             offset = CGSize.zero
                            }
                        }
                )
                actions()
                    .frame(width: actionWidth)
                    .opacity(opacity)
        }
    }
}




struct CustomSwipe: Gesture {
    @Binding var offset: CGSize
    
    var body: some Gesture {
        DragGesture()
            .onChanged { value in
                offset = CGSize(width: value.translation.width,
                                height: 0)
            }
    }
}

#Preview {
    MyView(color: .white)
}
