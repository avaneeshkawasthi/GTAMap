# MapTiles

A Swift Package for loading and displaying custom map tiles. This package provides a simple way to integrate custom map tiles into your iOS application.

## Features

- Load map tiles from embedded resources
- Access tiles using coordinate system (x, y, z)
- Optimized for iOS applications
- Easy integration with UIKit components
- Built-in caching for better performance

## Installation

### Using Swift Package Manager

1. Open your project in Xcode
2. Go to File > Add Packages...
3. Click the "+" button
4. Enter the package URL: `https://github.com/avaneeshkawasthi/GTAMap.git`
5. Click "Add Package"

### Using Package.swift

Add the package to your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/avaneeshkawasthi/GTAMap.git", from: "1.0.0")
]
```

## Usage

### Basic Usage

1. Import the package in your Swift file:
```swift
import MapTiles
```

2. Create a MapTiles instance:
```swift
let map = MapTiles()
```

3. Load a specific tile:
```swift
if let tileImage = map.tileImage(x: 100, y: 50, z: 13) {
    // Use the tile image
}
```

### Using WebView Implementation

The package now includes a `MapWebView` class that loads the map tiles using the embedded HTML file. This provides a more interactive map experience with built-in zoom and pan functionality.

```swift
import UIKit
import MapTiles

class MapViewController: UIViewController {
    private var mapWebView: MapWebView!
```

## Requirements

- iOS 13.0+
- Swift 5.7+
- Xcode 12.0+

## Note

- The package includes pre-packed map tile resources
- Make sure to request appropriate permissions if accessing location data
- The package is optimized for iOS devices with modern processors

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
