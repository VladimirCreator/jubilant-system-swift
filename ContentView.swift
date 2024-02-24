import SwiftUI

internal struct ContentView: View {
    internal var body: some View {
        TabView {
            NavigationStack {
                BookCollection()
            }
            .tabItem {
                Label("Книги", systemImage: "book")
            }
        }
    }
}
