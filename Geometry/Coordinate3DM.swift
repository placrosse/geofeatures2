/*
 *   Coordinate3DM.swift
 *
 *   Copyright 2016 Tony Stone
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 *
 *   Created by Tony Stone on 2/21/16.
 */
import Swift

/**
    Measured 3D Coordinate
 
    Low level 3 dimensional Coorodinate type with an m value.
 */
public class Coordinate3DM : Coordinate, ThreeDimensional, Measured, TupleConvertable {
    
    public typealias TupleType = (x: Double, y: Double, z: Double, m: Double)
    
    public let x: Double
    public let y: Double
    public let z: Double
    public let m: Double
    
    public var tuple: TupleType {
        get { return (x: self.x, y: self.y, z: self.z, m: self.m)  }
    }
    
    public required init(tuple: TupleType) {
        self.x = tuple.x
        self.y = tuple.y
        self.z = tuple.z
        self.m = tuple.m
    }

    public required init(tuple: TupleType, precision: Precision) {
        self.x = precision.convert(tuple.x)
        self.y = precision.convert(tuple.y)
        self.z = precision.convert(tuple.z)
        self.m = precision.convert(tuple.m)
    }
    
    public required init(other: Coordinate3DM) {
        self.x = other.x
        self.y = other.y
        self.z = other.z
        self.m = other.m
    }
    
    public required init(other: Coordinate3DM, precision: Precision) {
        self.x = precision.convert(other.x)
        self.y = precision.convert(other.y)
        self.z = precision.convert(other.z)
        self.m = precision.convert(other.m)
    }
    
    public required init(array: [Double]) {
        precondition(array.count == 4)
        self.x = array[0]
        self.y = array[1]
        self.z = array[2]
        self.m = array[3]
    }
    
}

public func ==(lhs: Coordinate3DM, rhs: Coordinate3DM) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.m == rhs.m
}

extension Coordinate3DM : CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description : String {
        return "(x: \(self.x), y: \(self.y), z: \(self.z), m: \(self.m))"
    }
    
    public var debugDescription : String {
        return self.description
    }
}
