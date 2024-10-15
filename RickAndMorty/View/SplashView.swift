import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool
    var body: some View {
        ZStack {
            Image("splashImage")
                .ignoresSafeArea(.all)
            Image("Rick_and_Morty")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}
