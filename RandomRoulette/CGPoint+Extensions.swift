//
//  CGPoint+Extensions.swift
//  RandomRoulette
//
//  Created by Jorge Benavides on 01/06/22.
//

import UIKit

extension CGPoint {
    /// displacement on `x` axis
    func dx(_ x: CGFloat) -> CGPoint {
        CGPoint(x: self.x + x, y: self.y)
    }
    /// displacement on `y` axis
    func dy(_ y: CGFloat) -> CGPoint {
        CGPoint(x: self.x, y: self.y + y)
    }
    /// displacement on `x` and `y` axis
    func displace(by point: CGPoint) -> CGPoint {
        dx(point.x).dy(point.y)
    }
}
