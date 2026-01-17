import SwiftUI

struct RowImageView: View {
    var image: URL?
    @State private var loader = ImageLoader()
    
    var body: some View {
        Group {
            if let uiImage = loader.image {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                ProgressView()
            }
        }
        .frame(width: 84, height: 64)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .task {
            await loader.loadImage(from: image)
        }
    }
}
