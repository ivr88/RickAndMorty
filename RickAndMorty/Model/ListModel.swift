import SwiftUI

// MARK: - ListModel

struct ListModel: Codable {
    let results: [Result]
}

// MARK: - Result

struct Result: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let gender: Gender
    let image: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

extension Result {
    var statusColor: Color {
        switch status.rawValue {
        case "Alive":
            return Color(UIColor(named: "#198737") ?? .white)
        case "Dead":
            return Color(UIColor(named: "#D62300") ?? .white)
        default:
            return Color(UIColor(named: "#686874") ?? .white)
        }
    }
}
