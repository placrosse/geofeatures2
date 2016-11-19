/*
 *   MultiPoint+GeometryTests.swift
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
 *   Created by Tony Stone on 4/24/16.
 */
import XCTest
import GeoFeatures

private let geometryDimension = Dimension.zero    // MultiPoint are always 0 dimension

// MARK: - Coordinate2D, FloatingPrecision, Cartesian -

class MultiPoint_Geometry_Coordinate2D_FloatingPrecision_Cartesian_Tests: XCTestCase {

    private typealias CoordinateType = Coordinate2D

    let precision = FloatingPrecision()
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }

    func testBoundary() {
        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Empty() {
        let input = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testIsSimple_WithNoEqualPoints() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.001, y: 1.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithNoEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.006, y: 2.006)), Point<CoordinateType>(coordinate: (x: 2.004, y: 2.004))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = false

        XCTAssertEqual(input.isSimple(), expected)
    }
}

// MARK: - Coordinate2DM, FloatingPrecision, Cartesian -

class MultiPoint_Geometry_Coordinate2DM_FloatingPrecision_Cartesian_Tests: XCTestCase {

    private typealias CoordinateType = Coordinate2DM

    let precision = FloatingPrecision()
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }

    func testBoundary() {
        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, m: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, m: 2.0))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Empty() {
        let input = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testIsSimple_WithNoEqualPoints() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.001, y: 1.001, m: 1.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, m: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithNoEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.006, y: 2.006, m: 2.006)), Point<CoordinateType>(coordinate: (x: 2.004, y: 2.004, m: 2.004))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, m: 2.002)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, m: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = false

        XCTAssertEqual(input.isSimple(), expected)
    }
}

// MARK: - Coordinate3D, FloatingPrecision, Cartesian -

class MultiPoint_Geometry_Coordinate3D_FloatingPrecision_Cartesian_Tests: XCTestCase {

    private typealias CoordinateType = Coordinate3D

    let precision = FloatingPrecision()
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }

    func testBoundary() {
        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, z: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, z: 2.0))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Empty() {
        let input = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testIsSimple_WithNoEqualPoints() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.001, y: 1.001, z: 1.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, z: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithNoEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.006, y: 2.006, z: 2.006)), Point<CoordinateType>(coordinate: (x: 2.004, y: 2.004, z: 2.004))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, z: 2.002)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, z: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = false

        XCTAssertEqual(input.isSimple(), expected)
    }
}

// MARK: - Coordinate3DM, FloatingPrecision, Cartesian -

class MultiPoint_Geometry_Coordinate3DM_FloatingPrecision_Cartesian_Tests: XCTestCase {

    private typealias CoordinateType = Coordinate3DM

    let precision = FloatingPrecision()
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }

    func testBoundary() {
        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, z: 1.0, m: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, z: 2.0, m: 1.0))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Empty() {
        let input = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testIsSimple_WithNoEqualPoints() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithNoEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.006, y: 2.006, z: 2.006, m: 2.006)), Point<CoordinateType>(coordinate: (x: 2.004, y: 2.004, z: 2.004, m: 2.004))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = false

        XCTAssertEqual(input.isSimple(), expected)
    }
}

// MARK: - Coordinate2D, FixedPrecision, Cartesian -

class MultiPoint_Geometry_Coordinate2D_FixedPrecision_Cartesian_Tests: XCTestCase {

    private typealias CoordinateType = Coordinate2D

    let precision = FixedPrecision(scale: 100)
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }

    func testBoundary() {
        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Empty() {
        let input = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testIsSimple_WithNoEqualPoints() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.001, y: 1.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithNoEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.006, y: 2.006)), Point<CoordinateType>(coordinate: (x: 2.004, y: 2.004))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.001, y: 2.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = false

        XCTAssertEqual(input.isSimple(), expected)
    }
}

// MARK: - Coordinate2DM, FixedPrecision, Cartesian -

class MultiPoint_Geometry_Coordinate2DM_FixedPrecision_Cartesian_Tests: XCTestCase {

    private typealias CoordinateType = Coordinate2DM

    let precision = FixedPrecision(scale: 100)
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }

    func testBoundary() {
        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, m: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, m: 2.0))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Empty() {
        let input = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testIsSimple_WithNoEqualPoints() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.001, y: 1.001, m: 1.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, m: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithNoEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.006, y: 2.006, m: 2.006)), Point<CoordinateType>(coordinate: (x: 2.004, y: 2.004, m: 2.004))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.001, y: 2.001, m: 2.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, m: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = false

        XCTAssertEqual(input.isSimple(), expected)
    }
}

// MARK: - Coordinate3D, FixedPrecision, Cartesian -

class MultiPoint_Geometry_Coordinate3D_FixedPrecision_Cartesian_Tests: XCTestCase {

    private typealias CoordinateType = Coordinate3D

    let precision = FixedPrecision(scale: 100)
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }

    func testBoundary() {
        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, z: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, z: 2.0))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Empty() {
        let input = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testEqual_True() {
        let input1 = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, z: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, z: 2.0))], precision: precision, coordinateReferenceSystem: crs)
        let input2 = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, z: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, z: 2.0))], precision: precision, coordinateReferenceSystem: crs)

        XCTAssertEqual(input1, input2)
     }

     func testEqual_False() {
        let input1            = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, z: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, z: 2.0))], precision: precision, coordinateReferenceSystem: crs)
        let input2: Geometry  = Point<Coordinate2D>(coordinate: (x: 1.0, y: 1.0), precision: precision, coordinateReferenceSystem: crs)

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
     }

    func testIsSimple_WithNoEqualPoints() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.001, y: 1.001, z: 1.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, z: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithNoEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.006, y: 2.006, z: 2.006)), Point<CoordinateType>(coordinate: (x: 2.004, y: 2.004, z: 2.004))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.001, y: 2.001, z: 2.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, z: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = false

        XCTAssertEqual(input.isSimple(), expected)
    }
}

// MARK: - Coordinate3DM, FixedPrecision, Cartesian -

class MultiPoint_Geometry_Coordinate3DM_FixedPrecision_Cartesian_Tests: XCTestCase {

    private typealias CoordinateType = Coordinate3DM

    let precision = FixedPrecision(scale: 100)
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }

    func testBoundary() {
        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, z: 1.0, m: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, z: 2.0, m: 1.0))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Empty() {
        let input = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiPoint<CoordinateType>(precision: precision, coordinateReferenceSystem: crs)  // Empty Set

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testEqual_True() {
        let input1 = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, z: 1.0, m: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, z: 2.0, m: 1.0))], precision: precision, coordinateReferenceSystem: crs)
        let input2 = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, z: 1.0, m: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, z: 2.0, m: 1.0))], precision: precision, coordinateReferenceSystem: crs)

        XCTAssertEqual(input1, input2)
     }

     func testEqual_False() {
        let input1            = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.0, y: 1.0, z: 1.0, m: 1.0)), Point<CoordinateType>(coordinate: (x: 2.0, y: 2.0, z: 2.0, m: 1.0))], precision: precision, coordinateReferenceSystem: crs)
        let input2: Geometry  = Point<Coordinate2D>(coordinate: (x: 1.0, y: 1.0), precision: precision, coordinateReferenceSystem: crs)

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
     }

    func testIsSimple_WithNoEqualPoints() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithNoEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.006, y: 2.006, z: 2.006, m: 2.006)), Point<CoordinateType>(coordinate: (x: 2.004, y: 2.004, z: 2.004, m: 2.004))], precision: precision, coordinateReferenceSystem: crs)
        let expected = true

        XCTAssertEqual(input.isSimple(), expected)
    }

    func testIsSimple_WithEqualPointsAfterPrecision() {

        let input = MultiPoint<CoordinateType>(elements: [Point<CoordinateType>(coordinate: (x: 2.001, y: 2.001, z: 2.001, m: 2.001)), Point<CoordinateType>(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: precision, coordinateReferenceSystem: crs)
        let expected = false

        XCTAssertEqual(input.isSimple(), expected)
    }
}
