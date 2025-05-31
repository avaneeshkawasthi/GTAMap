// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import UIKit

public struct MapTiles {
    public init() {}
    
    /// Returns the image for a specific tile coordinate
    /// - Parameters:
    ///   - x: X coordinate
    ///   - y: Y coordinate
    ///   - z: Zoom level
    /// - Returns: UIImage? if found, nil otherwise
    public func tileImage(x: Int, y: Int, z: Int) -> UIImage? {
        let fileName = "\(z)-\(x)_\(y).png"
        guard let path = Bundle.module.path(forResource: fileName, ofType: nil) else { return nil }
        return UIImage(contentsOfFile: path)
    }
    
    /// Returns the number of tiles available at a specific zoom level
    /// - Parameter z: Zoom level
    /// - Returns: Number of tiles in X and Y dimensions
    public func numberOfTilesAtZoom(z: Int) -> (x: Int, y: Int) {
        let maxTile = 1 << z
        return (maxTile, maxTile)
    }
}
