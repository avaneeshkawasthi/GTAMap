import UIKit
import WebKit

/// A simple view that loads the embedded map in a WebView
public class MapWebView: UIView {
    private let webView = WKWebView()
    
    /// Initialize the MapWebView
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupWebView()
        loadMap()
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
    
    private func loadMap() {
        guard let path = Bundle.module.path(forResource: "map", ofType: "html") else { return }
        
        do {
            let htmlContent = try String(contentsOfFile: path, encoding: .utf8)
            guard let baseURL = Bundle.module.resourceURL else { return }
            webView.loadHTMLString(htmlContent, baseURL: baseURL)
        } catch {
            print("Error loading map HTML: \(error)")
        }
    }
}
