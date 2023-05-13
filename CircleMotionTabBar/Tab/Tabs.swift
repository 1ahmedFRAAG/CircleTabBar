//
//  Tabs.swift
//  CircleMotionTabBar
//
//  Created by ahmed fraag on 10/05/2023.
//

import Foundation
import SwiftUI

enum tabsItems: String, CaseIterable {
    case home = "Home"
    case profile = "Profile"
    case settings = "Settings"
    case cart = "Cart"
    
    var image: String {
        switch self {
            case .home:
                return "house.fill"
            case .cart:
                return "cart.fill"
            case .settings:
                return "gear"
            case .profile:
                return "person.fill"
        }
    }
    
    var activeColor: Color {
        switch self {
            case .home:
                return .purple
            case .cart:
                return .blue
            case .settings:
                return .gray
            case .profile:
                return .black
        }
    }
    
    
    var index: Int {
        return tabsItems.allCases.firstIndex(of: self)! 
    }
}
