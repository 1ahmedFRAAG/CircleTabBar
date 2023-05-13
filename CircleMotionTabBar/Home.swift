//
//  Home.swift
//  CircleMotionTabBar
//
//  Created by ahmed fraag on 10/05/2023.
//

import SwiftUI

struct Home: View {
    @State var activeTab: tabsItems = .home
    @State var tabShapePosition: CGPoint = .zero
    
    // smoth animation
    @Namespace private var animation
    
    init() {
        
    }
    
    var body: some View {
        VStack {
            TabView(selection: $activeTab) {
                Text("Home")
                    .tag(tabsItems.home)
                
                Text("profile")
                    .tag(tabsItems.profile)
                
                Text("settings")
                    .tag(tabsItems.settings)
                
                Text("cart")
                    .tag(tabsItems.cart)
            }
            
            customTabBar()
        }.ignoresSafeArea()
        
    }
    
    @ViewBuilder
    func customTabBar() -> some View {
        
        HStack {
            ForEach(tabsItems.allCases, id: \.rawValue) {
                TabItemView(item: $0,
                            tintColor: Color.purple,
                            inActiveColor: Color.gray,
                            animation: animation,
                            selected: $activeTab,
                            position: $tabShapePosition)
            }
        }
        
        .padding(.horizontal, 10)
        .padding(.vertical, 25)
        .background{
            TabCustomShape(midPoint: tabShapePosition.x)
                .fill(Color.white)
                .ignoresSafeArea()
                .shadow(color: Color.gray.opacity(0.9), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top , 30)
                
        }
        
        .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.8), value: activeTab)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct TabItemView: View {
    
    var item: tabsItems
    var tintColor: Color
    var inActiveColor: Color
    var animation: Namespace.ID
    @Binding var selected: tabsItems
    @Binding var position: CGPoint
    // custom var to each tab represent mid point for the tab
    @State private var tabPosition: CGPoint = .zero
    
    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: item.image)
                .font(.title2)
                .frame(width: item == selected ? 58 : 35, height: item == selected ? 58 : 35)
                .foregroundColor(selected == item ? .white : .gray)
                
                .background{
                    if item == selected {
                        Circle().fill().foregroundColor(item.activeColor)
                            .frame(width: 60, height: 60)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }.offset(y: item == selected ? -15 : 0)
            
            Text(item.rawValue)
                .font(item == selected ? .title3 : .callout)
                .foregroundColor(selected == item ? item.activeColor : inActiveColor)
                .offset(y: item == selected ? 2 : 0)
        }
        
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(complation: { r in
            tabPosition.x = r.midX
            
            if selected == item {
                position.x = r.midX
            }
        })
        .onTapGesture {
            selected = item
        }
    }
}
