//: [Previous](@previous)

import Swift
import GeoFeatures2

/*:

Usage Scenarios
*/

var lineString1 = LineString<Coordinate2D>()
lineString1.append((1.001, 1.001))
lineString1.append((2.001, 2.001))
lineString1.append((3.001, 3.001))

// lineString1.append((3.003, 3.003, 3.003))  // Error:

lineString1.length()


let fixedPrecision = FixedPrecision(scale: 100)

let lineString = LineString<Coordinate2D>(elements: lineString1, precision: fixedPrecision)

var lineString2 = LineString<Coordinate2D>(elements: [(1.001, 1.001),(2.001, 2.001),(3.001, 3.001)], precision: fixedPrecision)

lineString == lineString2

lineString2.length()
lineString1 == lineString2
LineString(elements: lineString1, precision:  fixedPrecision) == lineString2    // Change linestring 1 precision by copying it

lineString2.append(Coordinate2D(tuple: (4.001, 4.001)))
lineString2.append((5.001, 5.001))

var lineString3 = LineString<Coordinate3DM>()
lineString3.append((0.0, 0.0, 0.0, 0.0))
lineString3.append((0.0, 1.0, 0.0, 0.0))
lineString3.append((0.0, 2.0, 0.0, 0.0))
lineString3.append((0.0, 3.0, 0.0, 0.0))

lineString3.length()

lineString1 == lineString1
lineString1 == lineString2
lineString1 == lineString3

// Create a Polygon with a tuple simaler to WKT with the syntax ([tuples], [[tuples]])
Polygon<Coordinate2D>(rings: ([(0,0), (0,7), (4,2), (2,0), (0,0)],[]))
Polygon<Coordinate2D>(rings: ([(0,0), (0,7), (4,2), (2,0), (0,0)],[[(0.5,0.5), (0.5,6.5), (3.5,1.5), (1.5,0.5), (0.5,0.5)]]))

Point<Coordinate2D>(coordinate: (1.0,2.0))
Point<Coordinate3DM>(coordinate: (1.0,2.0,3.0,4.0))

