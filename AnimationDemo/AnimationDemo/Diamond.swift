//
//  Diamond.swift
//  AnimationDemo
//
//  Created by Nader Alfares on 2/6/24.
//

import Foundation
import SwiftUI

struct Diamond : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.size.width
        let h = rect.size.height
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: w, y: h/2))
        path.addLine(to: CGPoint(x: w/2, y: h))
        path.addLine(to: CGPoint(x: 0, y: h/2))
        path.closeSubpath()
        return path
    }
}

