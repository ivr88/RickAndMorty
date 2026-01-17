import UIKit

final class ImageCache {
    
    static let shared = ImageCache()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {
        cache.countLimit = 200
        cache.totalCostLimit = 50 * 1024 * 1024
    }
    
    func image(for key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
    
    func insert(_ image: UIImage, for key: String) {
        let cost = image.pngData()?.count ?? 0
        cache.setObject(image, forKey: key as NSString, cost: cost)
    }
}
