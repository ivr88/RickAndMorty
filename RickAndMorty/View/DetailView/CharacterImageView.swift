import SwiftUI

struct CharacterImageView: View {
    var image: URL?

    var body: some View {
        AsyncImage(url: image) { image in
            image.image?
                .resizable()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 18))
        }
    }
}
