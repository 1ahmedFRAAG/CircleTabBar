//
//  TabCustomShape.swift
//  CircleMotionTabBar
//
//  Created by ahmed fraag on 11/05/2023.
//

import SwiftUI

struct TabCustomShape: Shape {
    var midPoint: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(cgPath: .init(rect: rect, transform: nil))
        path.move(to: .init(x: midPoint - 50, y: 0))
        
        // the curve is up so y is -25
        // add left curve (the half of the curve) controllers and point
        let toPoint = CGPoint(x: midPoint, y: -25)
        let controller1 = CGPoint(x: midPoint - 25, y: 0)
        let contrroller2 = CGPoint(x: midPoint - 25, y: -25)
        
        path.addCurve(to: toPoint, controlPoint1: controller1, controlPoint2: contrroller2)
        
        // add the down curve
        let toPoint2 = CGPoint(x: midPoint + 50, y: 0)
        let controller3 = CGPoint(x: midPoint + 25, y: -25)
        let controller4 = CGPoint(x: midPoint + 25, y: 0)
        path.addCurve(to: toPoint2, controlPoint1: controller3, controlPoint2: controller4)
        
        return Path(path.cgPath)
        /*
        return Path { path in
            // first drow rectangle frame for the tabBar
            path.addPath(Rectangle().path(in: rect))
            
            // draw the rect for curved shape
            // move the path to startPoint
            path.move(to: .init(x: midPoint - 50, y: 0))
            
            // the curve is up so y is -25
            // add left curve (the half of the curve) controllers and point
            let toPoint = CGPoint(x: midPoint, y: -25)
            let controller1 = CGPoint(x: midPoint - 25, y: 0)
            let contrroller2 = CGPoint(x: midPoint - 25, y: -25)
            
            path.addCurve(to: toPoint, control1: controller1, control2: contrroller2)
            
            // add the down curve
            let toPoint2 = CGPoint(x: midPoint + 50, y: 0)
            let controller3 = CGPoint(x: midPoint + 25, y: -25)
            let controller4 = CGPoint(x: midPoint + 25, y: 0)
            path.addCurve(to: toPoint2, control1: controller3, control2: controller4)
        }
        */
    }
}
