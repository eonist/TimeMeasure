import Foundation

public final class TimeMeasure {
   private static let nanoToSecond: Double = 1_000_000_000
   public typealias Operation = () throws -> Void
   /**
    * Measures how long a closure takes to complete
    * - Note: Great for UnitTesting
    * - Note: it's also possible to use. let startTime = CFAbsoluteTimeGetCurrent(); CFAbsoluteTimeGetCurrent() - startTime
    * ## Examples:
    * print("\(timeElapsed { sleep(2.2) })") // 2.20000
    */
   public static func timeElapsed(_ closure: Operation) rethrows -> Double {
      let start = DispatchTime.now()
      try closure()
      let end = DispatchTime.now()
      let diff = end.uptimeNanoseconds - start.uptimeNanoseconds
      return Double(diff) / nanoToSecond
   }
   /**
    * A time-measure that prints the time used, and returns the value of payload etc
    * - Note: so you can time individual times etc
    * timeElapsed { sleep(2.2) }.time // 2.20000
    */
   public static func timeElapsed<T>(_ closure: () throws -> T) rethrows -> (value: T, time: Double) {
      let start = DispatchTime.now()
      let retVal: T = try closure()
      let end = DispatchTime.now()
      let diff = end.uptimeNanoseconds - start.uptimeNanoseconds
      let time = Double(diff) / nanoToSecond
      return (retVal, time)
   }
}
