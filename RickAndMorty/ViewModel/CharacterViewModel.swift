import SwiftUI

@MainActor
@Observable
class CharacterViewModel {
    
    private let result: Result
    
    init(character: Result) {
        self.result = character
    }
    
    var name: String {
        result.name
    }
    
    var status: String {
        result.status.rawValue
    }
    
    var statusColor: Color {
        switch result.status {
        case .alive:
            return Color.customGreen
        case .dead:
            return Color.customRed
        default:
            return Color.customDarkGray
        }
    }
    
    var species: String {
        result.species.rawValue
    }
    
    var gender: String {
        result.gender.rawValue
    }
    
    var image: URL? {
        URL(string: result.image)
    }
    
    var episodes: String {
        result.episode.compactMap { url -> String? in
            if let id = url.split(separator: "/").last {
                return String(id)
            }
            return nil
        }.joined(separator: ", ")
    }
    
    var location: String {
        result.location.name
    }
}
