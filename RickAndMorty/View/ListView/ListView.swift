import SwiftUI

struct ListView: View {
    
    @Bindable var listViewModel: ListViewModel
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            content
        }
        .tint(.white)
        .foregroundStyle(.white)
        .task {
            await listViewModel.fetchCharacters()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch listViewModel.state {
        case .screenSave:
            ScreenSaveView()
        case .content:
            List (listViewModel.results) { character in
                NavigationLink {
                    DetailView(character: CharacterViewModel(character: character))
                        .toolbarRole(.editor)
                } label: {
                    RowView(character: CharacterViewModel(character: character))
                }
                .listRowBackground(Color.customBlack)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Rick & Morty Characters")
                            .font(.customFontBold(size: 24))
                    }
                }
                .toolbarBackground(.black, for: .navigationBar)
            }
            .refreshable { 
                await listViewModel.fetchCharacters()
            }
            .scrollContentBackground(.hidden)
            .background(.black)
            .listRowSpacing(4)
            .scrollIndicators(.hidden)
        case .error (let message):
            ErrorView(message: message)
        }
    }
}



