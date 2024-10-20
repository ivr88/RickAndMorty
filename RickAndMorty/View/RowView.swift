import SwiftUI

struct RowView: View {
    
    @ObservedObject var row: RowViewModel
    
    var body: some View {
        HStack {
            if let image = URL(string: row.character.image) {
                AsyncImage(url: image) { image in
                    image.image?
                        .resizable()
                        .frame(width: 84, height: 64)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }
            
            VStack (alignment: .leading, spacing: 6) {
                Text (row.character.name)
                    .font(.custom("IBMPlexSans-Medium", size: 18))
                HStack {
                    Text(row.character.status.rawValue)
                        .foregroundStyle(Color(row.character.statusColor))
                    Text("•")
                    Text(row.character.species.rawValue)
                }
                .font(.custom("IBMPlexSans-SemiBold", size: 12))
                
                Text(row.character.gender.rawValue)
                    .font(.custom("IBMPlexSans-Regular", size: 12))
            }
        }
    }
}
