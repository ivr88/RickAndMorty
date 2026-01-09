import SwiftUI

struct ListView: View {
    
    @Bindable var listViewModel: ListViewModel
    
    var body: some View {
        NavigationStack {
            List (listViewModel.results, id: \.id) { result in
                NavigationLink {
                    DetailView(detail: CharacterViewModel(character: result))
                        .toolbarRole(.editor)
                } label: {
                    RowView(row: CharacterViewModel(character: result))
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
            .scrollContentBackground(.hidden)
            .background(.black)
            .listRowSpacing(4)
            .scrollIndicators(.hidden)
        }
        .tint(.white)
        .foregroundStyle(.white)
        .task {
            await listViewModel.fetchCharacters()
        }
    }
}

