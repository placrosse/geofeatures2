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
public struct LineString<CoordinateType: Coordinate & CopyConstructable> {

    public let precision: Precision
    public let coordinateReferenceSystem: CoordinateReferenceSystem

    public init(coordinateReferenceSystem: CoordinateReferenceSystem) {
        self.init(precision: defaultPrecision, coordinateReferenceSystem: coordinateReferenceSystem)
    }

    public init(precision: Precision) {
        self.init(precision: precision, coordinateReferenceSystem: defaultCoordinateReferenceSystem)
    }

    public init(precision: Precision, coordinateReferenceSystem: CoordinateReferenceSystem) {
        self.precision = precision
        self.coordinateReferenceSystem = coordinateReferenceSystem

        buffer = CollectionBuffer<CoordinateType>.create(minimumCapacity: 8) { newBuffer in CollectionBufferHeader(capacity: newBuffer.capacity, count: 0) } as! CollectionBuffer<CoordinateType> // swiftlint:disable:this force_cast
    }

    /**
        Construct a LineString from another LineString (copy constructor).

        - parameters:
            - other: The LineString of the same type that you want to construct a new LineString from.
            - precision: The `Precision` model this polygon should use in calculations on it's coordinates.
            - coordinateReferenceSystem: The 'CoordinateReferenceSystem` this polygon should use in calculations on it's coordinates.

        - seealso: `CoordinateReferenceSystem`
        - seealso: `Precision`
     */
    public init(other: LineString<CoordinateType>, precision: Precision = defaultPrecision, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem) {

        self.init(precision: precision, coordinateReferenceSystem: coordinateReferenceSystem)

        other.buffer.withUnsafeMutablePointers { (header, elements) -> Void in

            self.reserveCapacity(numericCast(header.pointee.count))

            for index in 0..<header.pointee.count {
                self.append(elements[index])
            }
        }
    }

    internal var buffer: CollectionBuffer<CoordinateType>
}

extension LineString {

    @inline(__always)
    fileprivate mutating func _ensureUniquelyReferenced() {
        if !isKnownUniquelyReferenced(&buffer) {
            buffer = buffer.clone()
        }
    }

    @inline(__always)
    fileprivate mutating func _resizeIfNeeded() {
        if buffer.capacity == count {
            buffer = buffer.resize(buffer.capacity * 2)
        }
    }
}

// MARK: Collection conformance

extension LineString: Collection {

    /**
        LineStrings are empty constructable
     */
    public init() {
        self.init(precision: defaultPrecision, coordinateReferenceSystem: defaultCoordinateReferenceSystem)
    }

    /**
        LineString can be constructed from any Swift.Collection including Array as
        long as it has an Element type equal the Coordinate type specified in Element
        and the Distance is an Int type.
     */
    public init<C: Swift.Collection>(elements: C, precision: Precision = defaultPrecision, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem) where C.Iterator.Element == CoordinateType {

        self.init(precision: precision, coordinateReferenceSystem: coordinateReferenceSystem)

        self.reserveCapacity(numericCast(elements.count))

        var Iterator = elements.makeIterator()

        while let coordinate = Iterator.next() {
            self.append(coordinate)
        }
    }

    /**
        - Returns: The number of Coordinate3D objects.
     */
    public var count: Int {
        get { return self.buffer.header.count }
    }

    /**
        - Returns: The current minimum capacity.
     */
    public var capacity: Int {
        get { return self.buffer.header.capacity }
    }

    /**
        Reserve enough space to store `minimumCapacity` elements.

        - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous buffer.
     */
    public mutating func reserveCapacity(_ minimumCapacity: Int) {

        if buffer.capacity < minimumCapacity {

            _ensureUniquelyReferenced()

            let newSize = Math.max(buffer.capacity * 2, minimumCapacity)

            buffer = buffer.resize(newSize)
        }
    }

    /**
        Reserve enough space to store `minimumCapacity` elements.

        - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous buffer.
     */
    public mutating func append(_ newElement: CoordinateType) {

        _ensureUniquelyReferenced()
        _resizeIfNeeded()

        let convertedCoordinate = CoordinateType(other: newElement, precision: precision)

        buffer.withUnsafeMutablePointers { (header, elements) -> Void in

            elements.advanced(by: header.pointee.count).initialize(to: convertedCoordinate)
            header.pointee.count = header.pointee.count &+ 1
        }
    }

    /**
        Append the elements of `newElements` to this LineString.
     */
    public mutating func append<C: Swift.Collection>(contentsOf newElements: C) where C.Iterator.Element == CoordinateType {

        self.reserveCapacity(numericCast(newElements.count))

        var Iterator = newElements.makeIterator()

        while let coordinate = Iterator.next() {
            self.append(coordinate)
        }
    }

    /**
        Insert `newElement` at index `i` of this LineString.

        - Requires: `i <= count`.
     */
    public mutating func insert(_ newElement: CoordinateType, at index: Int) {
        guard (index >= 0) && (index < buffer.header.count) else { preconditionFailure("Index out of range.") }

        _ensureUniquelyReferenced()
        _resizeIfNeeded()

        let convertedCoordinate = CoordinateType(other: newElement, precision: precision)

        buffer.withUnsafeMutablePointers { (header, elements) -> Void in
            var m = header.pointee.count

            header.pointee.count = header.pointee.count &+ 1

            // Move the other elements
            while  m >= index {
                elements.advanced(by: m &+ 1).moveInitialize(from: elements.advanced(by: m), count: 1)
                m = m &- 1
            }
            (elements + index).initialize(to: convertedCoordinate)
        }
    }

    /**
        Remove and return the element at index `i` of this LineString.
     */
    @discardableResult
    public mutating func remove(at index: Int) -> CoordinateType {
        guard (index >= 0) && (index < buffer.header.count) else { preconditionFailure("Index out of range.") }

        return buffer.withUnsafeMutablePointers { (header, elements) -> CoordinateType in

            let result = (elements + index).move()

            var m = index

            // Move the other elements
            while  m <  header.pointee.count {
                elements.advanced(by: m).moveInitialize(from: elements.advanced(by: m &+ 1), count: 1)
                m = m &+ 1
            }
            header.pointee.count = header.pointee.count &- 1

            return result
        }
    }

    /**
        Remove an element from the end of this LineString.

        - Requires: `count > 0`.
     */
    @discardableResult
    public mutating func removeLast() -> CoordinateType {
        guard buffer.header.count > 0 else { preconditionFailure("can't removeLast from an empty LineString.") }

        return buffer.withUnsafeMutablePointers { (header, elements) -> CoordinateType in

            // No need to check for overflow in `header.pointee.count - 1` because `i` is known to be positive.
            header.pointee.count = header.pointee.count &- 1
            return elements.advanced(by: header.pointee.count).move()
        }
    }

    /**
        Remove all elements of this LineString.

        - Postcondition: `capacity == 0` if `keepCapacity` is `false`.
     */
    public mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {

        if keepCapacity {

            buffer.withUnsafeMutablePointers { (header, elements) -> Void in
                header.pointee.count = 0
            }
        } else {
            buffer = CollectionBuffer<CoordinateType>.create(minimumCapacity: 0) { newBuffer in CollectionBufferHeader(capacity: newBuffer.capacity, count: 0) } as! CollectionBuffer<CoordinateType> // swiftlint:disable:this force_cast
        }
    }
}

/**
    TupleConvertable extensions

    Coordinates that are TupleConvertable allow initialization via an ordinary Swift tuple.
 */
extension LineString where CoordinateType: TupleConvertable & CopyConstructable {

    /**
        LineString can be constructed from any Swift.Collection if it's Elements are tuples that match
        Self.Element's TupleType.

        ----

        - seealso: TupleConvertable.
     */
    public init<C: Swift.Collection>(elements: C, precision: Precision = defaultPrecision, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem) where C.Iterator.Element == CoordinateType.TupleType {

        self.init(precision: precision, coordinateReferenceSystem: coordinateReferenceSystem)

        self.reserveCapacity(numericCast(elements.count))

        var Iterator = elements.makeIterator()

        while let coordinate = Iterator.next() {
            self.append(coordinate)
        }
    }

    /**
        Reserve enough space to store `minimumCapacity` elements.

        - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous buffer.
     */
    public mutating func append(_ newElement: CoordinateType.TupleType) {
        self.append(CoordinateType(tuple: newElement))
    }

    /**
        Append the elements of `newElements` to this LineString.
     */
    public mutating func append<C: Swift.Collection>(contentsOf newElements: C) where C.Iterator.Element == CoordinateType.TupleType {

        _ensureUniquelyReferenced()

        self.reserveCapacity(numericCast(newElements.count) + buffer.header.count)

        var Iterator = newElements.makeIterator()

        while let coordinate = Iterator.next() {
            self.append(CoordinateType(tuple: coordinate))
        }
    }

    /**
        Insert `newElement` at index `i` of this LineString.

        - Requires: `i <= count`.
     */
    public mutating func insert(_ newElement: CoordinateType.TupleType, at i: Int) {
        self.insert(CoordinateType(tuple: newElement), at: i)
    }
}

// MARK: Swift.Collection conformance

extension LineString: Swift.Collection, MutableCollection, _DestructorSafeContainer {

    /**
        Returns the position immediately after `i`.

        - Precondition: `(startIndex..<endIndex).contains(i)`
     */
    public func index(after i: Int) -> Int {
        return i+1
    }

    /**
        Always zero, which is the index of the first element when non-empty.
     */
    public var startIndex: Int {
        return 0
    }

    /**
        A "past-the-end" element index; the successor of the last valid subscript argument.
     */
    public var endIndex: Int {
        return buffer.header.count
    }

    public subscript(index: Int) -> CoordinateType {

        get {
            guard (index >= 0) && (index < buffer.header.count) else { preconditionFailure("Index out of range.") }

            return buffer.withUnsafeMutablePointerToElements { $0[index] }
        }

        set (newValue) {
            guard (index >= 0) && (index < buffer.header.count) else { preconditionFailure("Index out of range.") }

            _ensureUniquelyReferenced()

            let convertedCoordinate = CoordinateType(other: newValue, precision: precision)

            buffer.withUnsafeMutablePointerToElements { elements -> Void in
                let element = elements.advanced(by: index)

                element.deinitialize()
                element.initialize(to: convertedCoordinate)
            }
        }
    }
}

// MARK: CustomStringConvertible & CustomDebugStringConvertible Conformance

extension LineString: CustomStringConvertible, CustomDebugStringConvertible {

    public var description: String {
        return "\(type(of: self))(\(self.flatMap { String(describing: $0) }.joined(separator: ", ")))"
    }

    public var debugDescription: String {
        return self.description
    }
}

// MARK: Equatable Conformance

extension LineString: Equatable {}

public func == <CoordinateType: Coordinate & CopyConstructable>(lhs: LineString<CoordinateType>, rhs: LineString<CoordinateType>) -> Bool {
    return lhs.equals(rhs)
}
