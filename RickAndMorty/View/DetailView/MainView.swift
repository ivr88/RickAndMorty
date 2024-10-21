import SwiftUI

struct MainView: View {
    var characterViewModel: CharacterViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            CharacterImageView(image: characterViewModel.image)
            
            CharacterStatusView(status: characterViewModel.status, statusColor: characterViewModel.statusColor)
            
            CharacterInfoView(characterViewModel: characterViewModel)
        }
        .padding(16)
        .background(Color(UIColor(named: "#151517") ?? .white))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(characterViewModel.name)
                    .font(.custom("IBMPlexSans-Bold", size: 24))
            }
        }
        Spacer()
    }
}
