import SwiftUI

class CharacterViewModel: ObservableObject {
    
    private let character: Result
    
    init(character: Result) {
        self.character = character
    }
    
    var name: String {
        character.name
    }
    
    var status: String {
        character.status.rawValue
    }
    
    var statusColor: Color {
        switch character.status {
        case .alive:
            return Color(UIColor(named: "#198737") ?? .white)
        case .dead:
            return Color(UIColor(named: "#D62300") ?? .white)
        default:
            return Color(UIColor(named: "#D62300") ?? .white)
        }
    }
    
    var species: String {
        character.species.rawValue
    }
    
    var gender: String {
        character.gender.rawValue
    }
    
    var image: URL? {
        URL(string: character.image)
    }
    
    var episodes: String {
        character.episode.compactMap { url -> String? in
            if let id = url.split(separator: "/").last {
                return String(id)
            }
            return nil
        }.joined(separator: ", ")
    }
    
    var location: String {
        character.location.name
    }
}
