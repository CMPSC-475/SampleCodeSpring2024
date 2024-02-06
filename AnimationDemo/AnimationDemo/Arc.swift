//
//  Arc.swift
//  AnimationDemo
//
//  Created by Nader Alfares on 2/6/24.
//

import Foundation
import SwiftUI

struct Arc : Shape {
    var offset : CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = min(rect.maxX/2, rect.maxY/2)
        path.move(to: CGPoint(x: rect.midX-radius, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX+radius, y: rect.midY), control: CGPoint(x:rect.midX, y:rect.midY-offset))
        return path
    }
}
