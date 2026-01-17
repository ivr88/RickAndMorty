import Foundation

enum NetworkError: Error, Equatable {
    case invalidURL
    case invalidResponse
    case badStatusCode(Int)
    case decodingFailed
}

protocol APIServiceProtocol {
    func obtainsCharacters() async throws -> [Result]
}

class APIService: APIServiceProtocol {
    func obtainsCharacters() async throws -> [Result] {
        let response = try await request(path: "/character", as: Character.self)
        return response.results
    }
    
    private let baseURL = "https://rickandmortyapi.com/api/"
    private let urlSession: URLSession
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    private func request<T: Decodable>(path: String, as type: T.Type) async throws -> T {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard let http = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(http.statusCode) else {
            throw NetworkError.badStatusCode(http.statusCode)
        }
        
        do {
            return try decoder.decode(type.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}


