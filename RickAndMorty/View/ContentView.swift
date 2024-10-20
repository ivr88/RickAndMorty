import SwiftUI

struct ContentView: View {
    
    @ObservedObject var listViewModel = ListViewModel()
    
    var body: some View {
        NavigationStack {
            List (listViewModel.characters, id: \.id) { character in
                NavigationLink {
                    DetailView()
                        .toolbarRole(.editor)
                } label: {
                    RowView(row: RowViewModel(character: character))
                }
                .listRowBackground(Color(UIColor(named: "#151517") ?? .white))
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Rick & Morty Characters")
                            .font(.custom("IBMPlexSans-Bold", size: 24))
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

