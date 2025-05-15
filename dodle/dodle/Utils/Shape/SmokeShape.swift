//
//  SmokeShape.swift
//  dodle
//
//  Created by taeni on 4/22/25.
//
import SwiftUI

struct SmokeView: View {
    @State private var animate = false

    var body: some View {
        SmokeShape()
            .stroke(Color.gray.opacity(0.4), lineWidth: 4)
            .frame(width: 60, height: 120)
            .offset(x: animate ? 40 : 0, y: animate ? -150 : 0)
            .scaleEffect(animate ? 1.3 : 1.0)
            .opacity(animate ? 0 : 1)
            .onAppear {
                withAnimation(
                    .easeOut(duration: 3.5).repeatForever(autoreverses: false)
                ) {
                    animate = true
                }
            }
    }
}

struct SmokeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // 연기가 비틀리며 올라가는 느낌의 곡선
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addCurve(to: CGPoint(x: rect.midX + 10, y: rect.midY + 20),
                      control1: CGPoint(x: rect.midX + 20, y: rect.maxY - 20),
                      control2: CGPoint(x: rect.midX - 20, y: rect.midY + 40))
        path.addCurve(to: CGPoint(x: rect.midX - 10, y: rect.minY),
                      control1: CGPoint(x: rect.midX + 30, y: rect.midY - 20),
                      control2: CGPoint(x: rect.midX - 30, y: rect.minY + 20))

        return path
    }
}

struct SmokeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            SmokeView()
        }
    }
}

