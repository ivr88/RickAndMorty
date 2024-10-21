import SwiftUI

struct InfoRowView: View {
    var title: String
    var value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.custom("IBMPlexSans-SemiBold", size: 16))
            ScrollView(.horizontal) {
                Text(value)
                    .font(.custom("IBMPlexSans-Regular", size: 16))
            }
            .scrollIndicators(.hidden)
        }
    }
}
