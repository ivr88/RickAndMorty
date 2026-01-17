import SwiftUI

struct DetailView: View {
    
    @Bindable var character: CharacterViewModel

    var body: some View {
        Color.black
            .ignoresSafeArea()
            .overlay(
                VStack {
                    ContainerView(character: character)
                }
                .padding(.horizontal, 20)
            )
    }
}
