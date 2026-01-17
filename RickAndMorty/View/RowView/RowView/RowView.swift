import SwiftUI

struct RowView: View {
    
    @Bindable var character: CharacterViewModel
    
    var body: some View {
        HStack {
            RowImageView(image: character.image)
            
            InfoView(character: character)
        }
    }
}
