///
/// Coordinate3DTests+XCTest.swift
///
/// Copyright 2016 Tony Stone
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
///  Created by Tony Stone on 5/4/16.
///
import XCTest

///
/// NOTE: This file was auto generated by file process_test_files.rb.
///
/// Do NOT edit this file directly as it will be regenerated automatically when needed.
///

extension Coordinate3DTests {

   static var allTests: [(String, (Coordinate3DTests) -> () throws -> Void)] {
      return [
                ("testInit_XYZ", testInit_XYZ),
                ("testX", testX),
                ("testY", testY),
                ("testZ", testZ),
                ("testInit_Tuple", testInit_Tuple),
                ("testTuple", testTuple),
                ("testInit_Array", testInit_Array),
                ("testInit_Array_Invalid_ToSmall", testInit_Array_Invalid_ToSmall),
                ("testInit_Array_Invalid_ToLarge", testInit_Array_Invalid_ToLarge),
                ("testInit_Copy", testInit_Copy),
                ("testInit_Copy_FixedPrecision", testInit_Copy_FixedPrecision),
                ("testDescription", testDescription),
                ("testDebugDescription", testDebugDescription),
                ("testEqual", testEqual),
                ("testNotEqual", testNotEqual),
                ("testHashValue_Zero", testHashValue_Zero),
                ("testHashValue_PositiveValue", testHashValue_PositiveValue),
           ]
   }
}
