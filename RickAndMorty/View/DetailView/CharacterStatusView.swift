import SwiftUI

struct CharacterStatusView: View {
    var status: String
    var statusColor: Color

    var body: some View {
        Text(status)
            .frame(maxWidth: .infinity)
            .font(.custom("IBMPlexSans-SemiBold", size: 16))
            .frame(height: 42)
            .background(statusColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
