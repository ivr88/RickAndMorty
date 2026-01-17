import SwiftUI

@main
struct RickAndMortyApp: App {
    @State var networkManager = NetworkMonitor()
    @State private var viewModel = ListViewModel(apiService: APIService())
    
    var body: some Scene {
        WindowGroup {
            ListView(listViewModel: viewModel)
                .environmentObject(networkManager)
        }
    }
}
