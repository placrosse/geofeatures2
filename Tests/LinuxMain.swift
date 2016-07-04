/*
 *   LinuxMain.swift
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
 *   Created by Tony Stone on 5/4/16.
 */
import XCTest

/*
 *   NOTE: This file was auto generated by file process_test_files.rb.
 *
 *   Do NOT edit this file directly as it will be regenerated automatically when needed.
 */

#if os(Linux) || os(FreeBSD)
   @testable import GeometryTestSuite

   XCTMain([
         testCase(Coordinate2DMTests.allTests),
         testCase(Coordinate2DTests.allTests),
         testCase(Coordinate3DMTests.allTests),
         testCase(Coordinate3DTests.allTests),
         testCase(FixedPrecisionTests.allTests),
         testCase(FloatingPrecisionTests.allTests),
         testCase(GeometryCollection_Geometry_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(GeometryCollection_Geometry_FixedPrecision_Cartesian_Tests.allTests),
         testCase(IntersectionMatrixTests.allTests),
         testCase(LinearRing_Curve_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Curve_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Geometry_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Geometry_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Geometry_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Geometry_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Geometry_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Geometry_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Geometry_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Geometry_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Surface_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Surface_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LinearRing_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Curve_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Curve_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Geometry_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Geometry_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Geometry_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Geometry_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Geometry_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Geometry_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Geometry_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Geometry_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(LineString_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiLineString_Curve_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiLineString_Curve_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiLineString_Geometry_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiLineString_Geometry_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiLineString_Geometry_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiLineString_Geometry_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiLineString_Geometry_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiLineString_Geometry_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiLineString_Geometry_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiLineString_Geometry_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Geometry_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Geometry_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Geometry_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Geometry_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Geometry_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Geometry_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Geometry_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Geometry_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPoint_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPolygon_Geometry_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPolygon_Geometry_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPolygon_Geometry_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPolygon_Geometry_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(MultiPolygon_Geometry_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPolygon_Geometry_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPolygon_Geometry_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPolygon_Geometry_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(MultiPolygon_Surface_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Point_Geometry_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Point_Geometry_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Point_Geometry_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Point_Geometry_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Point_Geometry_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Point_Geometry_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Point_Geometry_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Point_Geometry_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Point_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Point_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Point_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Point_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Point_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Point_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Point_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Point_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Polygon_Geometry_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Polygon_Geometry_Coordinate2DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Polygon_Geometry_Coordinate3D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Polygon_Geometry_Coordinate3DM_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(Polygon_Geometry_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Polygon_Geometry_Coordinate2DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Polygon_Geometry_Coordinate3D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Polygon_Geometry_Coordinate3DM_FixedPrecision_Cartesian_Tests.allTests),
         testCase(Polygon_Surface_Coordinate2D_FixedPrecision_Cartesian_Tests.allTests),
         testCase(WKTReader_Coordinate2D_FloatingPrecision_Cartesian_Tests.allTests),
         testCase(WKTWriter_Coordinate2D_Tests.allTests),
         testCase(WKTWriter_Coordinate2DM_Tests.allTests),
         testCase(WKTWriter_Coordinate3D_Tests.allTests),
         testCase(WKTWriter_Coordinate3DM_Tests.allTests),
    ])
#endif