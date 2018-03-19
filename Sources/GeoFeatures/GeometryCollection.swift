///
///  GeometryCollection.swift
///
///  Copyright (c) 2016 Tony Stone
///
///  Licensed under the Apache License, Version 2.0 (the "License");
///  you may not use this file except in compliance with the License.
///  You may obtain a copy of the License at
///
///  http://www.apache.org/licenses/LICENSE-2.0
///
///  Unless required by applicable law or agreed to in writing, software
///  distributed under the License is distributed on an "AS IS" BASIS,
///  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
///  See the License for the specific language governing permissions and
///  limitations under the License.
///
///  Created by Tony Stone on 2/14/2016.
///
import Swift

///
/// NOTE: This file was auto generated by gyb from file GeometryCollection.swift.gyb using the following command.
///
///     ~/gyb --line-directive '' -DSelf=GeometryCollection -DElement=Geometry -DCoordinateSpecialized=false -o GeometryCollection.swift GeometryCollection.swift.gyb
///
/// Do NOT edit this file directly as it will be regenerated automatically when needed.
///

///
/// GeometryCollection
///
/// A GeometryCollection is a collection of some number of Geometry objects.
///
/// All the elements in a GeometryCollection shall be in the same Spatial Reference System. This is also the Spatial Reference System for the GeometryCollection.
///
public struct GeometryCollection {

    public typealias Element = Geometry

    public let precision: Precision
    public let coordinateSystem: CoordinateSystem

    ///
    /// GeometryCollections are empty constructable
    ///
    public init() {
        self.init(precision: defaultPrecision, coordinateSystem: defaultCoordinateSystem)
    }

    public init(coordinateSystem: CoordinateSystem) {
        self.init(precision: defaultPrecision, coordinateSystem: coordinateSystem)
    }

    public init(precision: Precision) {
        self.init(precision: precision, coordinateSystem: defaultCoordinateSystem)
    }

    public init(precision: Precision, coordinateSystem: CoordinateSystem) {
        self.precision = precision
        self.coordinateSystem = coordinateSystem

        buffer = CollectionBuffer<Element>.create(minimumCapacity: 8) { newBuffer in CollectionBufferHeader(capacity: newBuffer.capacity, count: 0) } as! CollectionBuffer<Element> // swiftlint:disable:this force_cast
    }

    ///
    /// GeometryCollection can be constructed from any Swift.Collection including Array as
    /// long as it has an Element type equal the Geometry Element and the Distance
    /// is an Int type.
    ///
    public init<C: Swift.Collection>(elements: C, precision: Precision = defaultPrecision, coordinateSystem: CoordinateSystem = defaultCoordinateSystem)
            where C.Iterator.Element == Element {

        self.init(precision: precision, coordinateSystem: coordinateSystem)

        self.reserveCapacity(numericCast(elements.count))

        var Iterator = elements.makeIterator()

        while let element = Iterator.next() {
            self.append(element)
        }
    }

    internal var buffer: CollectionBuffer<Element>
}

// MARK: - Private methods

extension GeometryCollection {

    @inline(__always)
    fileprivate mutating func _ensureUniquelyReferenced() {
        if !isKnownUniquelyReferenced(&buffer) {
            buffer = buffer.clone()
        }
    }

    @inline(__always)
    fileprivate mutating func _resizeIfNeeded() {
        if buffer.header.capacity == buffer.header.count {
            buffer = buffer.resize(buffer.header.capacity * 2)
        }
    }
}

// MARK: - Collection conformance

extension GeometryCollection: Collection, MutableCollection, _DestructorSafeContainer {

   ///
    /// Returns the position immediately after `i`.
    ///
    /// - Precondition: `(startIndex..<endIndex).contains(i)`
    ///
    public func index(after i: Int) -> Int {
        return i+1
    }

    ///
    /// Always zero, which is the index of the first element when non-empty.
    ///
    public var startIndex: Int {
       return 0
    }

    ///
    /// A "past-the-end" element index; the successor of the last valid subscript argument.
    ///
    public var endIndex: Int {
        return buffer.header.count
    }

    public subscript(index: Int) -> Element {
        get {
            guard (index >= 0) && (index < buffer.header.count) else { preconditionFailure("Index out of range.") }

            return buffer.withUnsafeMutablePointerToElements { $0[index] }
        }
        set (newValue) {

            _ensureUniquelyReferenced()

            buffer.update(newValue, at: index)
        }
    }

    ///
    /// - Returns: The number of Geometry objects.
    ///
    public var count: Int {
        return self.buffer.header.count
    }

    ///
    /// - Returns: The current minimum capacity.
    ///
    public var capacity: Int {
        return self.buffer.header.capacity
    }

    ///
    /// Reserve enough space to store `minimumCapacity` elements.
    ///
    /// - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous buffer.
    ///
    public mutating func reserveCapacity(_ minimumCapacity: Int) {

        if buffer.capacity < minimumCapacity {

            _ensureUniquelyReferenced()

            let newSize = Swift.max(buffer.capacity * 2, minimumCapacity)

            buffer = buffer.resize(newSize)
        }
    }

    ///
    /// Append `newElement` to this GeometryCollection.
    ///
    public mutating func append(_ newElement: Element) {

        _ensureUniquelyReferenced()
        _resizeIfNeeded()

        buffer.append(newElement)
    }

    ///
    /// Append the elements of `newElements` to this GeometryCollection.
    ///
    public mutating func append<C: Swift.Collection>(contentsOf newElements: C)
            where C.Iterator.Element == Element {

        self.reserveCapacity(numericCast(newElements.count))

        var Iterator = newElements.makeIterator()

        while let element = Iterator.next() {
            self.append(element)
        }
    }

    ///
    /// Insert `newElement` at index `i` of this GeometryCollection.
    ///
    /// - Requires: `i <= count`.
    ///
    public mutating func insert(_ newElement: Element, at index: Int) {

        _ensureUniquelyReferenced()
        _resizeIfNeeded()

        buffer.insert(newElement, at: index)
    }

    ///
    /// Remove and return the element at index `i` of this GeometryCollection.
    ///
    @discardableResult
    public mutating func remove(at index: Int) -> Element {
        return buffer.remove(at: index)
    }

    ///
    /// Remove an element from the end of this GeometryCollection.
    ///
    /// - Requires: `count > 0`.
    ///
    @discardableResult
    public mutating func removeLast() -> Element {
        return buffer.removeLast()
    }

    ///
    /// Remove all elements of this GeometryCollection.
    ///
    /// - Postcondition: `capacity == 0` if `keepCapacity` is `false`.
    ///
    public mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {

        if keepCapacity {

            buffer.withUnsafeMutablePointerToHeader { (header) -> Void in
                header.pointee.count = 0
            }
        } else {
            buffer = CollectionBuffer<Element>.create(minimumCapacity: 0) { newBuffer in CollectionBufferHeader(capacity: newBuffer.capacity, count: 0) } as! CollectionBuffer<Element> // swiftlint:disable:this force_cast
        }
    }
}

// MARK: CustomStringConvertible & CustomDebugStringConvertible protocol conformance

extension GeometryCollection: CustomStringConvertible, CustomDebugStringConvertible {

    public var description: String {
        return "\(type(of: self))(\(self.flatMap { String(describing: $0) }.joined(separator: ", ")))"
    }

    public var debugDescription: String {
        return self.description
    }
}

// MARK: - Equatable Conformance

extension GeometryCollection: Equatable {}

public func == (lhs: GeometryCollection, rhs: GeometryCollection) -> Bool {
    return lhs.equals(rhs)
}
