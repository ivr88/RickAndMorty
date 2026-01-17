import SwiftUI

struct CharacterImageView: View {
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
       .frame(height: 320)
       .clipShape(RoundedRectangle(cornerRadius: 18))
       .task {
           await loader.loadImage(from: image)
       }
    }
}
