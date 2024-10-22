import SwiftUI

struct StatusView: View {
    var status: String
    var statusColor: Color
    
    var body: some View {
        Text(status)
            .foregroundStyle(Color(statusColor))
    }
}
