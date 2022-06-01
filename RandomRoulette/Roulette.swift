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
                    let radius: CGFloat = min(geometry.size.width, geometry.size.height) / 2
                    var angle: Double = 360
                    let increment = angle / Double(divisions)
                    while angle > 0 {
                        let offset: Double = 90 + increment/2
                        let radian: Double = (angle - offset) * .pi / 180
                        let x = radius * cos(radian)
                        let y = radius * sin(radian)
                        print(x, y)
                        path.move(to: center)
                        path.addLine(to: center.dy(y).dx(x))

                        angle -= increment
                    }
                }
                .stroke(divisionColor)
            }
        }
    }
}

struct Roulette_Previews: PreviewProvider {
    static var previews: some View {
        Roulette(divisions: 12)
    }
}
