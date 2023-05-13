//
//  TabPosition.swift
//  CircleMotionTabBar
//
//  Created by ahmed fraag on 11/05/2023.
//

import SwiftUI

struct TabPositionKey: PreferenceKey {
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
extension View {
    @ViewBuilder
    func viewPosition(complation: @escaping (CGRect) -> ()) -> some View {
        self.overlay {
            GeometryReader {
                let rect = $0.frame(in: .global)
                
                Color.clear
                    .preference(key: TabPositionKey.self, value: rect)
                    .onPreferenceChange(TabPositionKey.self, perform: complation)
            }
        }
    }
}
