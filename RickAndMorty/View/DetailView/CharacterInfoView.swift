import SwiftUI

struct CharacterInfoView: View {
    var characterViewModel: CharacterViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            InfoRowView(title: "Species:", value: characterViewModel.species)
            InfoRowView(title: "Gender:", value: characterViewModel.gender)
            InfoRowView(title: "Episodes:", value: characterViewModel.episodes)
            InfoRowView(title: "Last known location:", value: characterViewModel.location)
        }
    }
}
