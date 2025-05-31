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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create map web view
        mapWebView = MapWebView(x: 100, y: 50, z: 13)
        view.addSubview(mapWebView)
        
        // Add constraints
        mapWebView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapWebView.topAnchor.constraint(equalTo: view.topAnchor),
            mapWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
```

### Updating Map Location

You can update the map's location at any time:

```swift
// Move to a new location
mapWebView.moveTo(x: 150, y: 60, z: 14)
```

### WebView Features

- Built-in zoom and pan functionality
- Smooth tile loading
- Preserves all original HTML map features
- Automatic resource loading from embedded files
- Fully customizable through HTML/JS

### Customizing the Map

The map can be customized by modifying the embedded HTML file. The package includes:
- Leaflet.js for map functionality
- Custom markers
- Location data
- All necessary JavaScript and CSS files

To customize the map:
1. Modify the `map.html` file in the Resources directory
2. Update the JavaScript configuration in `locations.js`
3. Add custom markers or overlays as needed

### Performance Tips

- The WebView implementation is optimized for iOS devices
- Tiles are loaded on-demand for better performance
- Built-in caching is handled by the WebView
- Memory usage is optimized for mobile devices

### Important Notes

- The WebView requires internet access for initial load
- Map functionality is handled by Leaflet.js
- All resources are embedded in the package
- The map can be customized through JavaScript

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
