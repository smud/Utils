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
    public func forEachLine(handler: (_ line: String, _ stop: inout Bool) throws ->()) {
        let lines = replacingOccurrences(of: "\r\n", with: "\n")
            .components(separatedBy: "\n")
        var stop = false
        for line in lines {
            try handler(line, &stop)
            if stop {
                return
            }
        }
    }
}

