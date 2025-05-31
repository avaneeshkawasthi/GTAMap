import UIKit
import WebKit

/// A custom WebView that loads the map tiles using the embedded HTML file
public class MapWebView: UIView {
    private let webView = WKWebView()
    private var map: MapTiles
    
    /// Initialize the MapWebView with a specific starting location
    /// - Parameters:
    ///   - x: X coordinate
    ///   - y: Y coordinate
    ///   - z: Zoom level
    public init(x: Int = 100, y: Int = 50, z: Int = 13) {
        self.map = MapTiles()
        super.init(frame: .zero)
        setupWebView()
        loadMap(x: x, y: y, z: z)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupWebView() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: topAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func loadMap(x: Int, y: Int, z: Int) {
        guard let path = Bundle.module.path(forResource: "map", ofType: "html") else { return }
        
        // Read the HTML file
        do {
            var htmlContent = try String(contentsOfFile: path, encoding: .utf8)
            
            // Replace the initial coordinates in the HTML
            htmlContent = htmlContent.replacingOccurrences(of: "var initialX = 100;", with: "var initialX = \(x);")
            htmlContent = htmlContent.replacingOccurrences(of: "var initialY = 50;", with: "var initialY = \(y);")
            htmlContent = htmlContent.replacingOccurrences(of: "var initialZ = 13;", with: "var initialZ = \(z);")
            
            // Get the base URL for resources
            guard let baseURL = Bundle.module.resourceURL else { return }
            
            // Load the modified HTML
            webView.loadHTMLString(htmlContent, baseURL: baseURL)
        } catch {
            print("Error loading map HTML: \(error)")
        }
    }
    
    /// Update the map view's location
    /// - Parameters:
    ///   - x: New X coordinate
    ///   - y: New Y coordinate
    ///   - z: New zoom level
    public func moveTo(x: Int, y: Int, z: Int) {
        loadMap(x: x, y: y, z: z)
    }
}
