import SwiftUI

struct CharacterInfoView: View {
    var character: CharacterViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            InfoRowView(title: "Species:",
                        value: character.species)
            .scrollDisabled(true)
            
            InfoRowView(title: "Gender:",
                        value: character.gender)
            .scrollDisabled(true)
            
            InfoRowView(title: "Episodes:",
                        value: character.episodes)
            
            InfoRowView(title: "Last known location:",
                        value: character.location)
            .scrollDisabled(true)
        }
    }
}
