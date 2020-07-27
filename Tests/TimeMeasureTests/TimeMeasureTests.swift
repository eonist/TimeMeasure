import XCTest
@testable import TimeMeasure

final class TimeMeasureTests: XCTestCase {
    func testExample() {
        let (result, time): (String, Double) = TimeMeasure.timeElapsed {
           sleep(2)
           return "hello world"
        }
        Swift.print("result \(result) time \(time)")
    }

    static var allTests = [
        ("testExample", testExample)
    ]
}
