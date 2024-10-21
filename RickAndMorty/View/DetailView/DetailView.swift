import SwiftUI

struct DetailView: View {
    
    @ObservedObject var detail: CharacterViewModel

    var body: some View {
        Color.black
            .ignoresSafeArea()
            .overlay(
                VStack {
                    MainView(characterViewModel: detail)
                }
                .padding(.horizontal, 20)
            )
    }
}
