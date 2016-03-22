/*
 *   LineString.swift
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
 *   Created by Tony Stone on 2/14/16.
 */
import Swift

/*
    NOTE: This file was auto generated by gyb from file CoordinateCollection.swift.gyb using the following command.

        ~/gyb --line-directive '' -DSelf=LineString  -o LineString.swift CoordinateCollection.swift.gyb

    Do NOT edit this file directly as it will be regenerated automatically when needed.
*/

/**
    LineString
 
    A LineString is a Curve with linear interpolation between Coordinates. Each consecutive pair of
    Coordinates defines a Line segment.
 */
public struct LineString<CoordinateType : protocol<Coordinate, CopyConstructable>> : Geometry {

    public let precision: Precision
    public let coordinateReferenceSystem: CoordinateReferenceSystem
    
    public init(coordinateReferenceSystem: CoordinateReferenceSystem) {
        self.init(coordinateReferenceSystem: coordinateReferenceSystem, precision: defaultPrecision)
    }
    
    public init(precision: Precision) {
        self.init(coordinateReferenceSystem: defaultCoordinateReferenceSystem, precision: precision)
    }
    
    public init(coordinateReferenceSystem: CoordinateReferenceSystem, precision: Precision) {
        self.precision = precision
        self.coordinateReferenceSystem = coordinateReferenceSystem
        
        storage = CollectionBuffer<CoordinateType>.create(8) { _ in 0 } as! CollectionBuffer<CoordinateType>
    }

    internal var storage: CollectionBuffer<CoordinateType>
}

extension LineString {
    
    @inline(__always)
    private mutating func _ensureUniquelyReferenced() {
        if !isUniquelyReferencedNonObjC(&storage) {
            storage = storage.clone()
        }
    }

    @inline(__always)
    private mutating func _resizeIfNeeded() {
        if storage.allocatedElementCount == count {
            storage = storage.resize(count * 2)
        }
    }
}

// MARK: Collection conformance

extension LineString : Collection {
    
    /**
        LineStrings are empty constructable
     */
    public init() {
        self.init(coordinateReferenceSystem: defaultCoordinateReferenceSystem, precision: defaultPrecision)
    }
    
    /**
        LineString can be constructed from any SequenceType as long as it has an
        Element type equal the Coordinate type specified in Element.
     */
    public init<S : SequenceType where S.Generator.Element == CoordinateType>(elements: S, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem, precision: Precision = defaultPrecision) {
        
        self.init(coordinateReferenceSystem: coordinateReferenceSystem, precision: precision)
        
        var generator = elements.generate()
        
        while let coordinate = generator.next() {
            self.append(coordinate)
        }
    }
    
    /**
        LineString can be constructed from any CollectionType including Array as
        long as it has an Element type equal the Coordinate type specified in Element 
        and the Distance is an Int type.
     */
    public init<C : CollectionType where C.Generator.Element == CoordinateType>(elements: C, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem, precision: Precision = defaultPrecision) {
        
        self.init(coordinateReferenceSystem: coordinateReferenceSystem, precision: precision)
        
        self.reserveCapacity(numericCast(elements.count))
        
        var generator = elements.generate()
        
        while let coordinate = generator.next() {
            self.append(coordinate)
        }
    }
    
    /**
        - Returns: The number of Coordinate3D objects.
     */
    public var count: Int {
        get { return self.storage.value }
    }
    
    /**
        - Returns: The current minimum capacity.
     */
    public var capacity: Int {
        get { return self.storage.allocatedElementCount }
    }
    
    /**
        Reserve enough space to store `minimumCapacity` elements.
     
        - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous storage.
     */
    public mutating func reserveCapacity(minimumCapacity: Int) {
        
        if storage.allocatedElementCount < minimumCapacity {
            
            _ensureUniquelyReferenced()
            
            let newSize = max(storage.allocatedElementCount * 2, minimumCapacity)
            
            storage = storage.resize(newSize)
        }
    }
    
    /**
        Reserve enough space to store `minimumCapacity` elements.
     
        - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous storage.
     */
    public mutating func append(newElement: CoordinateType) {
        
        _ensureUniquelyReferenced()
        _resizeIfNeeded()
        
        let convertedCoordinate = CoordinateType(other: newElement, precision: precision)
         
        storage.withUnsafeMutablePointers { (value, elements)->Void in
            
            (elements + value.memory).initialize(convertedCoordinate)
            value.memory = value.memory &+ 1
        }
    }

    /**
        Append the elements of `newElements` to this LineString.
     */
    public mutating func append<S : SequenceType where S.Generator.Element == CoordinateType>(contentsOf newElements: S) {
        
        var generator = newElements.generate()
        
        while let coordinate = generator.next() {
            self.append(coordinate)
        }
    }
    
    /**
        Append the elements of `newElements` to this LineString.
     */
    public mutating func append<C : CollectionType where C.Generator.Element == CoordinateType>(contentsOf newElements: C) {
        
        self.reserveCapacity(numericCast(newElements.count))
        
        var generator = newElements.generate()
        
        while let coordinate = generator.next() {
            self.append(coordinate)
        }
    }
    
    /**
        Insert `newElement` at index `i` of this LineString.
     
        - Requires: `i <= count`.
     */
    public mutating func insert(newElement: CoordinateType, atIndex index: Int) {
        guard ((index >= 0) && (index < storage.value)) else { preconditionFailure("Index out of range.") }

        _ensureUniquelyReferenced()
        _resizeIfNeeded()
        
        let convertedCoordinate = CoordinateType(other: newElement, precision: precision)
        
        storage.withUnsafeMutablePointers { (count, elements)->Void in
            var m = count.memory
            
            count.memory = count.memory &+ 1
            
            // Move the other elements
            while  m >= index {
                (elements + (m &+ 1)).moveInitializeFrom((elements + m), count: 1)
                m = m &- 1
            }
            (elements + index).initialize(convertedCoordinate)
        }
    }
    
    /**
        Remove and return the element at index `i` of this LineString.
     */
    public mutating func remove(at index: Int) -> CoordinateType {
        guard ((index >= 0) && (index < storage.value)) else { preconditionFailure("Index out of range.") }

        return storage.withUnsafeMutablePointers { (count, elements)-> CoordinateType in
            
            let result = (elements + index).move()
            
            var m = index
            
            // Move the other elements
            while  m <  count.memory {
                (elements + m).moveInitializeFrom((elements + (m &+ 1)), count: 1)
                m = m &+ 1
            }
            count.memory = count.memory &- 1
            
            return result
        }
    }

    /**
        Remove an element from the end of this LineString.
     
        - Requires: `count > 0`.
     */
    public mutating func removeLast() -> CoordinateType {
        guard storage.value > 0 else { preconditionFailure("can't removeLast from an empty LineString.") }

        return storage.withUnsafeMutablePointers { (count, elements)-> CoordinateType in
            
            // No need to check for overflow in `count.memory - 1` because `i` is known to be positive.
            count.memory = count.memory &- 1
            return (elements + count.memory).move()
        }
    }

    /**
        Remove all elements of this LineString.
     
        - Postcondition: `capacity == 0` iff `keepCapacity` is `false`.
     */
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        
        if keepCapacity {
        
            storage.withUnsafeMutablePointers { (count, elements)-> Void in
                count.memory = 0
            }
        } else {
            storage = CollectionBuffer<CoordinateType>.create(0) { _ in 0 } as! CollectionBuffer<CoordinateType>
        }
    }
}

/**
    TupleConvertable extensions
 
    Coordinates that are TupleConvertable allow initialization via an ordinary Swift tuple.
 */
extension LineString where CoordinateType : protocol<TupleConvertable, CopyConstructable> {
    
    /**
        LineString can be constructed from any SequenceType if it's Elements are tuples that match
        Self.Element's TupleType.  
     
        ----
     
        - seealso: TupleConvertable.
     */
    public init<S : SequenceType where S.Generator.Element == CoordinateType.TupleType>(elements: S, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem, precision: Precision = defaultPrecision) {
        
        self.init(coordinateReferenceSystem: coordinateReferenceSystem, precision: precision)
        
        var generator = elements.generate()
        
        while let coordinate = generator.next() {
            self.append(coordinate)
        }
    }
    
    /**
        LineString can be constructed from any CollectionType if it's Elements are tuples that match
        Self.Element's TupleType.  
     
        ----
     
        - seealso: TupleConvertable.
     */
    public init<C : CollectionType where C.Generator.Element == CoordinateType.TupleType>(elements: C, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem, precision: Precision = defaultPrecision) {
        
        self.init(coordinateReferenceSystem: coordinateReferenceSystem, precision: precision)
        
        self.storage.resize(numericCast(elements.count))
        
        var generator = elements.generate()
        
        while let coordinate = generator.next() {
            self.append(coordinate)
        }
    }
    
    /**
        Reserve enough space to store `minimumCapacity` elements.
     
        - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous storage.
     */
    public mutating func append(newElement: CoordinateType.TupleType) {
        self.append(CoordinateType(tuple: newElement))
    }
    
    /**
        Append the elements of `newElements` to this LineString.
     */
    public mutating func append<S : SequenceType where S.Generator.Element == CoordinateType.TupleType>(contentsOf newElements: S) {
        
        var generator = newElements.generate()
        
        while let coordinate = generator.next() {
            self.append(CoordinateType(tuple: coordinate))
        }
    }
    
    /**
        Append the elements of `newElements` to this LineString.
     */
    public mutating func append<C : CollectionType where C.Generator.Element == CoordinateType.TupleType>(contentsOf newElements: C) {
        
        _ensureUniquelyReferenced()
        
        self.reserveCapacity(numericCast(newElements.count) + storage.value)
        
        var generator = newElements.generate()
        
        while let coordinate = generator.next() {
            self.append(CoordinateType(tuple: coordinate))
        }
    }
    
    /**
        Insert `newElement` at index `i` of this LineString.
     
        - Requires: `i <= count`.
     */
    public mutating func insert(newElement: CoordinateType.TupleType, atIndex i: Int) {
        self.insert(CoordinateType(tuple: newElement), atIndex: i)
    }
}


// MARK: CollectionType conformance

extension LineString : CollectionType, MutableCollectionType, _DestructorSafeContainer {
    
    /**
        Always zero, which is the index of the first element when non-empty.
     */
    public var startIndex : Int { return 0 }
    
    /**
        A "past-the-end" element index; the successor of the last valid subscript argument.
     */
    public var endIndex  : Int { return storage.value }
    
    public subscript(index : Int) -> CoordinateType {
        
        get {
            guard ((index >= 0) && (index < storage.value)) else { preconditionFailure("Index out of range.") }
            
            return storage.withUnsafeMutablePointerToElements { $0[index] }
        }
        
        set (newValue) {
            guard ((index >= 0) && (index < storage.value)) else { preconditionFailure("Index out of range.") }

            _ensureUniquelyReferenced()
            
            let convertedCoordinate = Element(other: newValue, precision: precision)
            
            storage.withUnsafeMutablePointerToElements { elements->Void in
                
                (elements + index).destroy()
                (elements + index).initialize(convertedCoordinate)
            }
        }
    }
}

// MARK: CustomStringConvertible & CustomDebugStringConvertible Conformance

extension LineString : CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description : String {
        return "\(self.dynamicType)(\(self.flatMap { String($0) }.joinWithSeparator(", ")))"
    }
    
    public var debugDescription : String {
        return self.description
    }
}

