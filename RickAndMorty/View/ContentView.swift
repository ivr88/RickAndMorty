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
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.image?
                                .resizable()
                                .frame(width: 84, height: 64)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        
                        VStack (alignment: .leading, spacing: 6) {
                            Text (character.name)
                                .font(.custom("IBMPlexSans-Medium", size: 18))
                            HStack {
                                Text(character.status.rawValue)
                                    .foregroundStyle(Color(character.statusColor))
                                Text("•")
                                Text(character.species.rawValue)
                            }
                            .font(.custom("IBMPlexSans-SemiBold", size: 12))
                            
                            Text(character.gender.rawValue)
                                .font(.custom("IBMPlexSans-Regular", size: 12))
                        }
                    }
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
        .foregroundStyle(.white)
        .onAppear {
            listViewModel.fetchCharacters()
        }
    }
}

