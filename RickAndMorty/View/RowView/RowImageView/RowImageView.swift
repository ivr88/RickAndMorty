import SwiftUI

struct RowImageView: View {
    var image: URL?
    
    var body: some View {
        AsyncImage(url: image) { image in
            image.image?
                .resizable()
                .frame(width: 84, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
