import SwiftUI

struct InfoRowView: View {
    var title: String
    var value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.customFontSemiBold(size: 16))
            ScrollView(.horizontal) {
                Text(value)
                    .font(.customFontRegular(size: 16))
            }
            .scrollIndicators(.hidden)
        }
    }
}
