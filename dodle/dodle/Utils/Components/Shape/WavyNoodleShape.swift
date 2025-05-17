//
//  NoodleTest2View.swift
//  dodle
//
//  Created by taeni on 5/17/25.
//

import SwiftUI

struct RoundNoodleShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addEllipse(in: rect)
        }
    }
}
struct SquareNoodleShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addRoundedRect(in: rect, cornerSize: CGSize(width: 10, height: 10))
        }
    }
}

struct NoodleTestView: View {
    @State private var negative: CGFloat = 0.0
    @State private var positive: CGFloat = 0.5
    
    var body: some View {
        VStack {
            
            WavyNoodleShape(progress: negative, waveCount: 20)
                .stroke(Color.noodle, lineWidth: 3 + 6 * positive)
                .frame(width: 300, height: 300)
                .animation(.easeInOut(duration: 0.3), value: negative)
                .animation(.easeInOut(duration: 0.3), value: positive)
                .shadow(color: Color.cardGray, radius: 1, x: 1, y: 2)
            
            ZStack {
                WaterShape()
                    .foregroundColor(Color.water)
                    .opacity(0.8)
                    .frame(width:300, height: 250)
                
                WavyNoodleShape(progress: negative, waveCount: 15)
                    .stroke(Color.noodle, lineWidth: 1 + 2 * positive)
                    .frame(width: 300, height: 100)
                    .animation(.easeInOut(duration: 0.3), value: negative)
                    .animation(.easeInOut(duration: 0.3), value: positive)
                    .mask{
                        WaterShape()
                            .foregroundColor(Color.water)
                            .frame(width:300, height: 250)
                    }
            }
            
            
            VStack {
                Text("progress2")
                Slider(value: $positive, in: 0...1)
                    .padding(.horizontal)
            }
            
            VStack {
                Text("progress1")
                Slider(value: $negative, in: 0...1)
                    .padding(.horizontal)
            }
            
        }
    }
}

struct WavyNoodleShape: Shape {
    var progress: CGFloat
    let waveCount: Int   // 원하는 웨이브 개수 고정
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let waveLength = rect.height / CGFloat(waveCount)  // 웨이브 한 개당 높이 고정
        let waveHeight = waveLength * 0.5 * (0.3 + progress)
        
        for i in 0..<waveCount {
            let y = CGFloat(i) * waveLength + rect.minY
            path.move(to: CGPoint(x: rect.minX, y: y))
            
            var currentX = rect.minX
            while currentX < rect.maxX {
                let midX = currentX + waveLength / 2
                let endX = currentX + waveLength
                
                let isEven = (Int((currentX / waveLength)) % 2 == 0)
                let controlY = y + (isEven ? waveHeight : -waveHeight)
                
                path.addQuadCurve(to: CGPoint(x: endX, y: y),
                                  control: CGPoint(x: midX, y: controlY))
                
                currentX = endX
            }
        }
        
        return path
    }
}

#Preview {
    NoodleTestView()
}

