import SwiftUI

struct ScreenSaveView: View {
    var body: some View {
        ZStack {
            Image("screenImage")
                .resizable()
                .ignoresSafeArea()
            Image("Rick_and_Morty")
        }
    }
}
