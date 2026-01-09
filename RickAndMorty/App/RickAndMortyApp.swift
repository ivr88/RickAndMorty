import SwiftUI

@main
struct RickAndMortyApp: App {
    @StateObject var networkManager = NetworkMonitor()
    
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environmentObject(networkManager)
        }
    }
}
