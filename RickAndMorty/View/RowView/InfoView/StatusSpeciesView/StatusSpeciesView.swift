import SwiftUI

struct StatusSpeciesView: View {
    var character: CharacterViewModel
    
    var body: some View {
        HStack {
            StatusView(status: character.status,
                       statusColor: character.statusColor)
            
            Text("•")
            
            SpeciesView(species: character.species)
        }
        .font(.custom("IBMPlexSans-SemiBold", size: 12))
    }
}
