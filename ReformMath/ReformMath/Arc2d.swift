//
//  Arc2d.swift
//  ReformMath
//
//  Created by Laszlo Korte on 21.09.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

public struct Arc2d : Equatable {
    public let center : Vec2d
    public let radius: Double
    public let start: Angle
    public let end: Angle

    public init(center: Vec2d, radius:Double, start: Angle, end: Angle) {
        self.center = center
        self.radius = radius
        self.start = start
        self.end = end
    }
}

public func ==(lhs: Arc2d, rhs: Arc2d) -> Bool {
    return lhs.center == rhs.center && lhs.radius == rhs.radius && lhs.start == rhs.start && lhs.end == rhs.end
}

extension Arc2d {
    public var length : Double {
        return 2 * M_PI * radius * normalize360(end-start).percent/100
    }
}

extension Arc2d {
    public var circle : Circle2d {
        return Circle2d(center: center, radius: radius)
    }

    public var quadrants : [Arc2d] {
        return [
            (Angle(percent: 0), Angle(percent: 25)),
            (Angle(percent: 25), Angle(percent: 50)),
            (Angle(percent: 50), Angle(percent: 75)),
            (Angle(percent: 75), Angle(percent: 100)),
        ].lazy.flatMap { range in
            intersection(range: range, range: (start, end))
        }.flatMap { (start, end) in
            Arc2d(center: center, radius: radius, start: start, end: end)
        }
    }
}
