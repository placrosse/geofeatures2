///
/// TokenizerTests+XCTest.swift
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

extension TokenizerTests {

   static var allTests: [(String, (TokenizerTests) -> () throws -> Void)] {
      return [
                ("testExpect_SingleWhiteSpace_True", testExpect_SingleWhiteSpace_True),
                ("testExpect_SingleWhiteSpace_False", testExpect_SingleWhiteSpace_False),
                ("testMatch_SingleWhiteSpace_True", testMatch_SingleWhiteSpace_True),
                ("testMatch_SingleWhiteSpace_False", testMatch_SingleWhiteSpace_False),
                ("testMatch_NewLine_True", testMatch_NewLine_True),
                ("testMatch_NewLine_False", testMatch_NewLine_False),
                ("testColumn", testColumn),
                ("testLine", testLine),
                ("testMatchString", testMatchString),
           ]
   }
}
