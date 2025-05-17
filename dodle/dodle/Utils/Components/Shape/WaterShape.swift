//
//  SourceShape.swift
//  dodle
//
//  Created by taeni on 4/19/25.
//
import SwiftUI

struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        let originalWidth: CGFloat = 1200
        let originalHeight: CGFloat = 1000
        
        let scale = min(rect.width / originalWidth, rect.height / originalHeight)
        let scaledWidth = originalWidth * scale
        let scaledHeight = originalHeight * scale
        
        let offsetX = (rect.width - scaledWidth) / 2
        let offsetY = (rect.height - scaledHeight) / 2

        func scaledPoint(x: CGFloat, y: CGFloat) -> CGPoint {
            CGPoint(x: x * scale + offsetX, y: y * scale + offsetY)
        }

        var path = Path()
        path.move(to: scaledPoint(x: 200.343, y: 356.811))
        path.addCurve(to: scaledPoint(x: 200.146, y: 339.799),
                      control1: scaledPoint(x: 197.28, y: 351.57),
                      control2: scaledPoint(x: 197.227, y: 345.121))
        path.addCurve(to: scaledPoint(x: 571.653, y: 170),
                      control1: scaledPoint(x: 248.02, y: 252.501),
                      control2: scaledPoint(x: 396.233, y: 170))
        path.addCurve(to: scaledPoint(x: 943.16, y: 339.801),
                      control1: scaledPoint(x: 747.073, y: 170),
                      control2: scaledPoint(x: 895.287, y: 252.503))
        path.addCurve(to: scaledPoint(x: 942.963, y: 356.813),
                      control1: scaledPoint(x: 946.079, y: 345.123),
                      control2: scaledPoint(x: 946.026, y: 351.572))
        path.addCurve(to: scaledPoint(x: 571.654, y: 490),
                      control1: scaledPoint(x: 894.88, y: 439.082),
                      control2: scaledPoint(x: 746.833, y: 490))
        path.addCurve(to: scaledPoint(x: 200.343, y: 356.811),
                      control1: scaledPoint(x: 396.473, y: 490),
                      control2: scaledPoint(x: 248.424, y: 439.082))
        path.closeSubpath()

        return path
    }
}

#Preview {
    // 컴포넌트로 소스 색깔만 지정할 수 있게 바꾸자
    ZStack {
        RecipeImage(name: "cup")
            .frame(width: 300)
            .scaledToFit()
        
        WaterShape()
            .frame(width: 300, height: 250)
            .foregroundColor(Color.water)
        
    }
}
