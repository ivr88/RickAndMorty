import SwiftUI

struct ListView: View {
    
    @ObservedObject var listViewModel = ListViewModel()
    
    var body: some View {
        NavigationStack {
            List (listViewModel.characters, id: \.id) { character in
                NavigationLink {
                    DetailView(detail: CharacterViewModel(character: character))
                        .toolbarRole(.editor)
                } label: {
                    RowView(row: CharacterViewModel(character: character))
                }
                .listRowBackground(Color(UIColor(named: "#151517") ?? .white))
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
        .onAppear {
            listViewModel.fetchCharacters()
        }
    }
}

