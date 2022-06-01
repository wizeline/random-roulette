//
//  CGPoint+Extensions.swift
//  RandomRoulette
//
//  Created by Jorge Benavides on 01/06/22.
//

import UIKit

extension CGPoint {
    func dx(_ x: CGFloat) -> CGPoint {
        CGPoint(x: self.x + x, y: self.y)
    }
    func dy(_ y: CGFloat) -> CGPoint {
        CGPoint(x: self.x, y: self.y + y)
    }
}
