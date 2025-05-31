import SwiftUI
import MapTiles

struct ContentView: View {
    var body: some View {
        MapWebView(frame: UIScreen.main.bounds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
