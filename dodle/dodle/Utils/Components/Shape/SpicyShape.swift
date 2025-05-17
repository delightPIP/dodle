//
//  RedOutlineShape.swift
//  dodle
//
//  Created by taeni on 4/18/25.
//
import SwiftUI

struct GreenInnerShape: Shape {
    func path(in rect: CGRect) -> Path {
        let originalWidth: CGFloat = 160
        let originalHeight: CGFloat = 240
        let scaleX = rect.width / originalWidth
        let scaleY = rect.height / originalHeight

        func scaledPoint(x: CGFloat, y: CGFloat) -> CGPoint {
            return CGPoint(x: x * scaleX, y: y * scaleY)
        }

        var path = Path()

        path.move(to: scaledPoint(x: 153.891, y: 43.798))
        path.addCurve(to: scaledPoint(x: 155.323, y: 38.2698),
                      control1: scaledPoint(x: 154.159, y: 42.6316),
                      control2: scaledPoint(x: 155.323, y: 39.5106))
        path.addCurve(to: scaledPoint(x: 137.162, y: 23.23),
                      control1: scaledPoint(x: 155.323, y: 28.7512),
                      control2: scaledPoint(x: 147.419, y: 23.23))
        path.addCurve(to: scaledPoint(x: 117.075, y: 35.018),
                      control1: scaledPoint(x: 128.29, y: 23.23),
                      control2: scaledPoint(x: 118.916, y: 27.2977))
        path.addCurve(to: scaledPoint(x: 136.331, y: 33.3666),
                      control1: scaledPoint(x: 121.386, y: 32.2942),
                      control2: scaledPoint(x: 129.584, y: 32.6397))
        path.addCurve(to: scaledPoint(x: 153.891, y: 43.798),
                      control1: scaledPoint(x: 145.273, y: 34.3301),
                      control2: scaledPoint(x: 151.134, y: 38.4042))
        path.closeSubpath()

        path.move(to: scaledPoint(x: 135.493, y: 0))
        path.addCurve(to: scaledPoint(x: 139.685, y: 1.40113),
                      control1: scaledPoint(x: 136.978, y: 0),
                      control2: scaledPoint(x: 138.395, y: 0.481463))
        path.addCurve(to: scaledPoint(x: 145.307, y: 12.6008),
                      control1: scaledPoint(x: 142.36, y: 3.89775),
                      control2: scaledPoint(x: 145.307, y: 10.1202))
        path.addLine(to: scaledPoint(x: 145.307, y: 26.2587))
        path.addCurve(to: scaledPoint(x: 144.129, y: 27.2134),
                      control1: scaledPoint(x: 145.307, y: 26.5527),
                      control2: scaledPoint(x: 144.717, y: 27.2015))
        path.addLine(to: scaledPoint(x: 137.938, y: 25.9125))
        path.addCurve(to: scaledPoint(x: 137.162, y: 24.9579),
                      control1: scaledPoint(x: 137.486, y: 25.8175),
                      control2: scaledPoint(x: 137.162, y: 25.4192))
        path.addLine(to: scaledPoint(x: 137.162, y: 12.6682))
        path.addCurve(to: scaledPoint(x: 136.061, y: 8.74521),
                      control1: scaledPoint(x: 137.002, y: 11.5321),
                      control2: scaledPoint(x: 136.633, y: 9.94029))
        path.addCurve(to: scaledPoint(x: 135.178, y: 7.48799),
                      control1: scaledPoint(x: 135.766, y: 8.12964),
                      control2: scaledPoint(x: 135.46, y: 7.71033))
        path.addCurve(to: scaledPoint(x: 134.539, y: 7.34777),
                      control1: scaledPoint(x: 134.943, y: 7.30189),
                      control2: scaledPoint(x: 134.764, y: 7.27296))
        path.addCurve(to: scaledPoint(x: 132.805, y: 8.04596),
                      control1: scaledPoint(x: 133.855, y: 7.5755),
                      control2: scaledPoint(x: 132.878, y: 8.01283))
        path.addCurve(to: scaledPoint(x: 130.147, y: 8.21497),
                      control1: scaledPoint(x: 132.444, y: 8.21028),
                      control2: scaledPoint(x: 131.149, y: 8.58405))
        path.addCurve(to: scaledPoint(x: 127.977, y: 5.41953),
                      control1: scaledPoint(x: 128.918, y: 7.04683),
                      control2: scaledPoint(x: 128.478, y: 6.51964))
        path.addCurve(to: scaledPoint(x: 128.22, y: 3.6848),
                      control1: scaledPoint(x: 127.81, y: 4.79717),
                      control2: scaledPoint(x: 127.904, y: 4.21067))
        path.addCurve(to: scaledPoint(x: 131.106, y: 1.3677),
                      control1: scaledPoint(x: 128.947, y: 2.82404),
                      control2: scaledPoint(x: 129.878, y: 2.13569))
        path.addCurve(to: scaledPoint(x: 135.493, y: 0),
                      control1: scaledPoint(x: 132.533, y: 0.477189),
                      control2: scaledPoint(x: 134.014, y: 0))
        path.closeSubpath()

        return path
    }
}

struct OrangeShape: Shape {
    func path(in rect: CGRect) -> Path {
        let originalWidth: CGFloat = 160
        let originalHeight: CGFloat = 240
        let scaleX = rect.width / originalWidth
        let scaleY = rect.height / originalHeight

        func scaledPoint(x: CGFloat, y: CGFloat) -> CGPoint {
            return CGPoint(x: x * scaleX, y: y * scaleY)
        }

        var path = Path()

        path.move(to: scaledPoint(x: 93.6177, y: 59.3595))
        path.addCurve(to: scaledPoint(x: 134.669, y: 43.7506),
                      control1: scaledPoint(x: 102.74, y: 44.7912),
                      control2: scaledPoint(x: 124.786, y: 42.8834))
        path.addCurve(to: scaledPoint(x: 164.968, y: 73.3426),
                      control1: scaledPoint(x: 151.284, y: 47.0024),
                      control2: scaledPoint(x: 163.783, y: 56.7813))
        path.addCurve(to: scaledPoint(x: 152.588, y: 132.526),
                      control1: scaledPoint(x: 165.62, y: 82.4478),
                      control2: scaledPoint(x: 156.171, y: 120.169))
        path.addCurve(to: scaledPoint(x: 118.053, y: 188.133),
                      control1: scaledPoint(x: 149.004, y: 144.883),
                      control2: scaledPoint(x: 130.433, y: 170.898))
        path.addCurve(to: scaledPoint(x: 55.8248, y: 232.359),
                      control1: scaledPoint(x: 105.672, y: 205.368),
                      control2: scaledPoint(x: 71.1375, y: 224.879))
        path.addCurve(to: scaledPoint(x: 5, y: 236.261),
                      control1: scaledPoint(x: 40.5122, y: 239.838),
                      control2: scaledPoint(x: 5, y: 243.09))
        path.addCurve(to: scaledPoint(x: 55.8248, y: 179.028),
                      control1: scaledPoint(x: 5, y: 229.432),
                      control2: scaledPoint(x: 44.096, y: 193.011))
        path.addCurve(to: scaledPoint(x: 78.6309, y: 114.316),
                      control1: scaledPoint(x: 67.5536, y: 165.045),
                      control2: scaledPoint(x: 76.3503, y: 126.348))
        path.addCurve(to: scaledPoint(x: 93.6177, y: 59.3595),
                      control1: scaledPoint(x: 80.9115, y: 102.284),
                      control2: scaledPoint(x: 82.2147, y: 77.5699))

        return path
    }
}

#Preview {
    ZStack {
        GreenInnerShape()
            .fill(.green)
        OrangeShape()
            .fill(.black.opacity(0.6))
    }
    .frame(width: 80, height: 120)
}
