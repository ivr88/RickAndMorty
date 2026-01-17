import UIKit

@MainActor
@Observable 
final class ImageLoader {
    
    var image: UIImage?
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func loadImage (from url: URL?) async {
        guard let url else { return }
        
        let key = url.absoluteString
        
        if let cached = ImageCache.shared.image(for: key) {
            image = cached
            return
        }
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            guard let uiImage = UIImage(data: data) else { return }
            ImageCache.shared.insert(uiImage, for: key)
            image = uiImage
        } catch {
            image = nil
        }
    }
}
