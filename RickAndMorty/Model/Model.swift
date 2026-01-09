import SwiftUI

// MARK: - ListModel
struct Character: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Identifiable, Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let gender: Gender
    let location: Location
    let image: String
    let episode: [String]
}

// MARK: - Gender
enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
}

// MARK: - Species
enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

// MARK: - Status
enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
