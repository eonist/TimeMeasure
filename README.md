# TimeMeasure ⏱

- Measure time consumed by a closure (great for performance testing)

### Examples:
```swift
print(TimeMeasure.timeElapsed { sleep(2.2) }) // 2.20000
print(TimeMeasure.timeElapsed { sleep(2.2); return 0 }.time) // 2.20000
print(TimeMeasure.timeElapsed { sleep(2.2); return 0 }.value) // 0 (retrieves the value)
let (val, time): (String, Double) = TimeMeasure.timeElapsed {
	sleep(2.2); return "abc"
}
print(val) // abc
print(time) // 2.20000
```
### Installation:
- SPM: `.package(url: "https://github.com/eonist/TimeMeasure.git", .branch("master"))`

### Todo:
- Add github badge
