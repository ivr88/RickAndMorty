import SwiftUI

struct CoordinatorView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ListView()
        } else {
            SplashView(isActive: $isActive)
        }
    }
}
