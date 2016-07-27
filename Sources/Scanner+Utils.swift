//
// Scanner+Utils.swift
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

extension Scanner {
#if os(Linux)
    public var isAtEnd: Bool { return atEnd }
#endif

#if os(Linux)
    public func scanString(_ searchString: String) -> String? {
        return scanString(string: searchString)
    }
#elseif os(OSX)
    public func scanString(_ searchString: String) -> String? {
        var result: NSString?
        guard scanString(string, into: &result) else {
            return nul
        }
        return result
    }

#endif

    @discardableResult
    public func skipString(_ string: String) -> Bool {
        return scanString(string) != nil
    }

#if os(Linux)
    public func scanCharacters(from set: CharacterSet) -> String? {
        return scanCharactersFromSet(set)
    }
#elseif os(OSX)
    public func scanCharacters(from: CharacterSet) -> String? {
        var result: NSString?
        guard scanCharacters(from: from, into: &result) else {
            return nil
        }
        return result
    }
#endif

#if os(Linux)
    public func scanUpTo(_ string: String) -> String? {
        return scanUpToString(string)
    }
#elseif os(OSX)
    public func scanUpTo(_ string: String) -> String? {
        var result: NSString?
        guard scanUpTo(string, into: &result) else {
            return nil
        }
        return result
    }
#endif

#if os(Linux)
    public func scanUpToCharacters(from set: CharacterSet) -> String? {
        return scanUpToCharactersFromSet(set)
    }
#elseif os(OSX)
    public func scanUpToCharacters(from set: CharacterSet) -> String? {
        var result: NSString?
        guard scanUpToCharacters(from: set, into: &result) else {
            return nil
        }
        return result
    }
#endif
}


