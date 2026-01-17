import SwiftUI

@MainActor
@Observable
final class ListViewModel {
    
    enum State: Equatable {
        case screenSave
        case content
        case error(String)
    }
    
    var results: [Result] = []
    var state: State = .screenSave
        
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchCharacters() async {
        try? await Task.sleep(for: .seconds(3))
        do {
            results = try await apiService.obtainsCharacters()
            state = .content
        } catch let error as NetworkError {
            results = []
            handleError(error)
        } catch {
            state = .error("Unexpected error")
        }
    }
    
    private func handleError(_ error: NetworkError) {
        switch error {
        case .decodingFailed:
            state = .error("Decoding error")
        case .badStatusCode(let code):
            state = .error("Server error \(code)")
        case .invalidURL:
            state = .error("Wrong URL")
        case .invalidResponse:
            state = .error("No response from the server")
        }
    }
}


