//
//  Roulette.swift
//  RandomRoulette
//
//  Created by Jorge Benavides
//

import SwiftUI

struct Roulette: View {

    let divisions: Int
    let color: Color
    let divisionColor: Color

    public init(divisions: Int, color: Color = .black, divisionColor: Color = .white) {
        self.divisions = divisions
        self.color = color
        self.divisionColor = divisionColor
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(color)
            GeometryReader { geometry in
                Path { path in
                    guard divisions > 1 else { return }
                    let center = CGPoint(x: geometry.size.width/2, y: geometry.size.height/2)
                    let radius: Double = min(geometry.size.width, geometry.size.height) / 2
                    var angle: Double = 360
                    let increment = angle / Double(divisions)
                    while angle > 0 {
                        let offset: Double = angle - (90 + increment/2)
                        let point = center.displace(by: self.point(for: offset, with: radius))
                        path.move(to: center)
                        path.addLine(to: point)
                        path.addRelativeArc(center: center, radius: radius, startAngle: Angle(degrees: offset), delta: Angle(degrees: increment), transform: .identity)
                        path.addLine(to: center)
                        angle -= increment
                    }
                }
                .stroke(divisionColor)
            }
        }
    }

    /// c^2 = a^2 + b^2
    /// x = base, y = height
    private func point(for angle: Double, with radius: Double) -> CGPoint {
        let radian: Double = angle * .pi / 180
        let x = radius * cos(radian)
        let y = radius * sin(radian)
        return CGPoint(x: x, y: y)
    }

}

struct Roulette_Previews: PreviewProvider {
    static var previews: some View {
        Roulette(divisions: 12, color: .gray, divisionColor: .orange)
    }
}
