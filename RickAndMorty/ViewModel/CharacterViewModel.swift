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
            return Color.customGreen
        case .dead:
            return Color.customRed
        default:
            return Color.customDarkGray
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
