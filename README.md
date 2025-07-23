# SwiftCache

Welcome to SwiftCache! SwiftCache is an efficient and effective replacement for NSCache in Swift!

## Installation
### Swift Package Manager (Preferred)
`.package("https://github.com/thackerdynasty/SwiftCache.git", from: "1.0.0")`
### CocoaPods
`pod 'NativeCache'` (This is NOT a typo, SwiftCache was already taken on CocoaPods)
## Quick start
It's pretty simple:
```
import Foundation
import SwiftCache

let cache = Cache()
```
Full documentation can be found [here](https://thackerdynasty.github.io/SwiftCache/documentation/swiftcache).
## Testing
### Method 1. Xcode
In order to test in xcode, open the folder in xcode, then go to the tests tab, make sure `SwiftCache.xctestplan` is selected, and then run the tests!
### Method 2. Command Line
`cd` to the cloned repo, and then run `swift test`.
