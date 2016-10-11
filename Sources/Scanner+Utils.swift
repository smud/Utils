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
        guard scanString(searchString, into: &result) else { return nil }
        return result as? String
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
        guard scanCharacters(from: from, into: &result) else { return nil }
        return result as? String
    }
#endif

#if os(Linux)
    public func scanUpTo(_ string: String) -> String? {
        return scanUpToString(string)
    }
#elseif os(OSX)
    public func scanUpTo(_ string: String) -> String? {
        var result: NSString?
        guard scanUpTo(string, into: &result) else { return nil }
        return result as? String
    }
#endif
    
    public func skipUpTo(_ string: String) -> Bool {
        return scanUpTo(string) != nil
    }

#if os(Linux)
    public func scanUpToCharacters(from set: CharacterSet) -> String? {
        return scanUpToCharactersFromSet(set)
    }
#elseif os(OSX)
    public func scanUpToCharacters(from set: CharacterSet) -> String? {
        var result: NSString?
        guard scanUpToCharacters(from: set, into: &result) else { return nil }
        return result as? String
    }
#endif

    public var scanLocationInCharacters: Int {
        let utf16 = string.utf16
        guard let to16 = utf16.index(utf16.startIndex, offsetBy: scanLocation, limitedBy: utf16.endIndex),
            let to = String.Index(to16, within: string) else {
                return 0
        }
        return string.distance(from: string.startIndex, to: to)
    }
    
    private var currentCharacterIndex: String.CharacterView.Index? {
        let utf16 = string.utf16
        guard let to16 = utf16.index(utf16.startIndex, offsetBy: scanLocation, limitedBy: utf16.endIndex),
            let to = String.Index(to16, within: string) else {
                return nil
        }
        // to is a String.CharacterView.Index
        return to
    }
    
    public var parsedText: String {
        guard let index = currentCharacterIndex else { return "" }
        return string.substring(to: index)
    }

    public var textToParse: String {
        guard let index = currentCharacterIndex else { return "" }
        return string.substring(from: index)
    }
    
    public var line: Int {
        var lineCount = 1
        for character in parsedText.characters {
            if character == "\n" { lineCount += 1 }
        }
        return lineCount
    }
    
    public var column: Int {
        let text = parsedText
        if let range = text.range(of: "\n", options: .backwards) {
            return text.distance(from: range.upperBound, to: text.endIndex) + 1
        }
        return parsedText.characters.count + 1
    }
}


