import XCTest
@testable import Utils

class UtilsTests: XCTestCase {
    let text1_1 = ""
    let text1_2 = "\r"
    let text1_3 = "\n"
    let text1_4 = "\r\n"

    let text2_1 = "a"
    let text2_2 = "a\r"
    let text2_3 = "a\n"
    let text2_4 = "a\r\n"

    let text3_1 = "a\rb"
    let text3_2 = "a\nb"
    let text3_3 = "a\r\nb"

    let text4_1 = "a\nb\r"
    let text4_2 = "a\nb\n"
    let text4_3 = "a\nb\r\n"
    
    let text5_1 = "a\r\rb"
    let text5_2 = "a\n\nb"
    let text5_3 = "a\r\n\r\nb"
    let text5_4 = "a\r\r\nb"
    let text5_5 = "a\r\n\nb"

    let text6_1 = "\r\r"
    let text6_2 = "\n\n"
    let text6_3 = "\r\n\r\n"
    let text6_4 = "\r\r\n"
    let text6_5 = "\r\n\n"

    func testForEachLine() {
        printLines("text1_1", text1_1)
        printLines("text1_2", text1_2)
        printLines("text1_3", text1_3)
        printLines("text1_4", text1_4)

        printLines("text2_1", text2_1)
        printLines("text2_2", text2_2)
        printLines("text2_3", text2_3)
        printLines("text2_4", text2_4)

        printLines("text3_1", text3_1)
        printLines("text3_2", text3_2)
        printLines("text3_3", text3_3)

        printLines("text4_1", text4_1)
        printLines("text4_2", text4_2)
        printLines("text4_3", text4_3)

        printLines("text5_1", text5_1)
        printLines("text5_2", text5_2)
        printLines("text5_3", text5_3)
        printLines("text5_4", text5_4)
        printLines("text5_5", text5_5)

        printLines("text6_1", text6_1)
        printLines("text6_2", text6_2)
        printLines("text6_3", text6_3)
        printLines("text6_4", text6_4)
        printLines("text6_5", text6_5)

        equalToLines(text1_1, [])
        equalToLines(text1_2, [""])
        equalToLines(text1_3, [""])
        equalToLines(text1_4, [""])
        
        equalToLines(text2_1, ["a"])
        equalToLines(text2_2, ["a"])
        equalToLines(text2_3, ["a"])
        equalToLines(text2_4, ["a"])
        
        equalToLines(text3_1, ["a", "b"])
        equalToLines(text3_2, ["a", "b"])
        equalToLines(text3_3, ["a", "b"])
        
        equalToLines(text4_1, ["a", "b"])
        equalToLines(text4_2, ["a", "b"])
        equalToLines(text4_3, ["a", "b"])
        
        equalToLines(text5_1, ["a", "", "b"])
        equalToLines(text5_2, ["a", "", "b"])
        equalToLines(text5_3, ["a", "", "b"])
        equalToLines(text5_4, ["a", "", "b"])
        equalToLines(text5_5, ["a", "", "b"])
        
        equalToLines(text6_1, ["", ""])
        equalToLines(text6_2, ["", ""])
        equalToLines(text6_3, ["", ""])
        equalToLines(text6_4, ["", ""])
        equalToLines(text6_5, ["", ""])
    }

    func printLines(_ name: String, _ text: String) {
        var i = 0
        print("\n[\(name): \(text.debugDescription)]")
        text.forEachLine { line, stop in
            print("\(i): \(line.debugDescription)")
            i += 1
        }
    }
    
    func equalToLines(_ text: String, _ lines: [String]) {
        var i = 0
        text.forEachLine { line, stop in
            XCTAssertEqual(line, lines[i])
            i += 1
        }
    }

    static var allTests : [(String, (UtilsTests) -> () throws -> Void)] {
        return [
            ("testForEachLine", testForEachLine),
        ]
    }
}
