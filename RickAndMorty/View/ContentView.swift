import SwiftUI

struct ContentView: View {
    
    @ObservedObject var listViewModel = ListViewModel()
    
    var body: some View {
        List (listViewModel.characters, id: \.id) { character in
            HStack {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.image?
                        .resizable()
                        .frame(width: 84, height: 64)
                        .clipShape(.rect(cornerRadius: 10))
                }
                    
                VStack (alignment: .leading) {
                    Text (character.name)
                    HStack {
                        Text(character.status.rawValue)
                            .foregroundStyle(Color(character.statusColor))
                        Text("•")
                        Text(character.species.rawValue)
                    }
                    Text(character.gender.rawValue)
                }
            }
        }
        .onAppear {
            listViewModel.fetchCharacters()
        }
    }
}

#Preview {
    ContentView()
}
