//
//  NoodleShape.swift
//  dodle
//
//  Created by taeni on 4/21/25.
//
import SwiftUI

struct NoodleShape: Shape {
    var offsetY: CGFloat
    var waveHeight: CGFloat
    var waveLength: CGFloat
    var phase: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY + offsetY))
        
        for x in stride(from: 0, through: rect.width, by: 0.7) {
            let relativeX = x / waveLength + phase
            let y = waveHeight * sin(relativeX * .pi * 2) + rect.midY + offsetY
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return path
    }
}


//#Preview {
//    ZStack {
//        WaterShape()
//            .fill(Color.blue.opacity(0.2)) // 물 색 배경 (선택)
//        
//        ZStack {
//            ForEach(0..<20, id: \.self) { i in
//                let offsetY = CGFloat(i) * 3 - 45 // 조밀하게
//                let waveHeight = CGFloat.random(in: 3...6)
//                let waveLength = CGFloat.random(in: 12...18)
//                let phase = CGFloat.random(in: 0...2)
//                
//                NoodleShape(
//                    offsetY: offsetY,
//                    waveHeight: waveHeight,
//                    waveLength: waveLength,
//                    phase: phase
//                )
//                .stroke(Color.orange, lineWidth: 1.7)
//            }
//        }
//        .clipShape(WaterShape()) // 물 모양 안에 면발만 보이게
//    }
//    .frame(width: 300, height: 200)
//    .border(.red)
//}



struct AnimatedNoodleView: View {
    @State private var phase: CGFloat = 0.0

    var body: some View {
        ZStack {
            WaterShape()
                .fill(Color.blue.opacity(0.2))
            
            ZStack {
                ForEach(0..<20, id: \.self) { i in
                    let offsetY = CGFloat(i) * 3 - 45
                    let waveHeight = CGFloat.random(in: 3...6)
                    let waveLength = CGFloat.random(in: 12...18)
                    
                    NoodleShape(
                        offsetY: offsetY,
                        waveHeight: waveHeight,
                        waveLength: waveLength,
                        phase: phase + CGFloat(i) * 0.2
                    )
                    .stroke(Color.orange, lineWidth: 1.7)
                }
            }
            .clipShape(WaterShape())
        }
        .frame(width: 300, height: 200)
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                phase = 2.0
            }
        }
    }
}

#Preview {
    AnimatedNoodleView()
}
