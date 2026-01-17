import SwiftUI

struct InfoView: View {
    var character: CharacterViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 6) {
            NameView(name: character.name)
            
            StatusSpeciesView(character: character)
            
            GenderView(gender: character.gender)
        }
    }
}
