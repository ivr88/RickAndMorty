import SwiftUI

struct ContainerView: View {
    var character: CharacterViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            CharacterImageView(image: character.image)
            
            CharacterStatusView(status: character.status,
                                statusColor: character.statusColor)
            
            CharacterInfoView(character: character)
        }
        .padding(16)
        .background(Color.customBlack)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(character.name)
                    .font(.customFontBold(size: 24))
            }
        }
        Spacer()
    }
}
