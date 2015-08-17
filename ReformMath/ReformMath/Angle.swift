//
//  Angle.swift
//  ReformMath
//
//  Created by Laszlo Korte on 13.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

public struct Angle {
    public static let PI = Angle(radians: M_PI)
    
    public let radians : Double
    
    public var degree : Double { get { return radians * 360 / (2*3.141) } }
    public var percent : Double { get { return radians * 100 / (2*3.141) } }
    
    public init(percent: Double) {
        self.init(radians: M_PI * percent / 100.0)
    }
    
    public init(radians: Double) {
        self.radians = radians
    }
    
    public init(degree: Double) {
        self.init(radians: M_PI * degree / 360.0)
    }
}