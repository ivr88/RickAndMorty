import SwiftUI

final class ListViewModel: ObservableObject {
    
    @Published var characters: [Result] = []
        
    private let apiService = APIService()
    
    func fetchCharacters() {
        apiService.fetch()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.characters = self?.apiService.result ?? []
        }
    }
}
