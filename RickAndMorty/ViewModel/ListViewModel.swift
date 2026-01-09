import SwiftUI

@Observable
final class ListViewModel {
    
    enum State: Equatable {
        case loading
        case empty
        case content
        case error(String)
    }
    
    var results: [Result] = []
    var state: State = .loading
        
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchCharacters() async {
        do {
            results = try await apiService.obtainsCharacters()
            state = results.isEmpty ? .empty : .content
        }
        
        catch NetworkError.decodingFailed {
            results = []
            state = .error("Failed to decode users")
        }
        catch let NetworkError.badStatusCode(code) {
            results = []
            state = .error("Server error \(code)")
        }
        catch {
            results = []
            state = .error("Unexpected error")
        }
    }
}
