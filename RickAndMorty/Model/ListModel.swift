import Foundation

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

