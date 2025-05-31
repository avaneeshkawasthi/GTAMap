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

### Displaying Map Tiles

Here's a complete example of how to display map tiles in a UIImageView:

```swift
import UIKit
import MapTiles

class MapViewController: UIViewController {
    private var imageView: UIImageView!
    private let map = MapTiles()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create image view
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        // Load and display tile
        if let tileImage = map.tileImage(x: 100, y: 50, z: 13) {
            imageView.image = tileImage
        }
        
        // Add constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 256),
            imageView.heightAnchor.constraint(equalToConstant: 256)
        ])
    }
}
```

### Getting Map Dimensions

You can get the number of tiles at a specific zoom level:

```swift
let (width, height) = map.numberOfTilesAtZoom(z: 13)
print("Number of tiles at zoom level 13: \(width) x \(height)")
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
