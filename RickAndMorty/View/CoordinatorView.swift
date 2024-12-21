import SwiftUI

struct CoordinatorView: View {
    
    @ObservedObject private var networkMonitor = NetworkMonitor()
    
    @State private var isActive = false
    
    var body: some View {
        if networkMonitor.isConnected && isActive {
            ListView()
        } else if !networkMonitor.isConnected {
            ErrorView()
        } else {
            SplashView(isActive: $isActive)
        }
    }
}
