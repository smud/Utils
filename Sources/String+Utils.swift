//
// ConfigFile.swift
//
// This source file is part of the SMUD open source project
//
// Copyright (c) 2016 SMUD project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SMUD project authors
//

import Foundation

extension String {
    #if os(Linux)
    public func forEachLine(handler: (line: String, stop: inout Bool)->()) {
        let lines = components(separatedBy: "\n")
        var stop = false
        for var line in lines {
            if line.hasSuffix("\r") {
                line = line.substring(to: line.index(before: line.endIndex))
            }
            handler(line: line, stop: &stop)
            if stop {
                return
            }
        }
    }
    #elseif os(OSX)
    public func forEachLine(handler: (line: String, stop: inout Bool)->()) {
        return enumerateLines(handler)
    }
    #endif
}

