import SwiftUI

struct RowView: View {
    
    @ObservedObject var row: CharacterViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: row.image) { image in
                image.image?
                    .resizable()
                    .frame(width: 84, height: 64)
                    .clipShape(.rect(cornerRadius: 10))
            }
            
            VStack (alignment: .leading, spacing: 6) {
                Text (row.name)
                    .font(.custom("IBMPlexSans-Medium", size: 18))
                HStack {
                    Text(row.status)
                        .foregroundStyle(Color(row.statusColor))
                    Text("•")
                    Text(row.species)
                }
                .font(.custom("IBMPlexSans-SemiBold", size: 12))
                
                Text(row.gender)
                    .font(.custom("IBMPlexSans-Regular", size: 12))
            }
        }
    }
}
