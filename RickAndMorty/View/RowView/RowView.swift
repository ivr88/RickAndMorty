import SwiftUI

struct RowView: View {
    
    @ObservedObject var row: CharacterViewModel
    
    var body: some View {
        HStack {
            RowImageView(image: row.image)
            
            InfoView(character: row)
        }
    }
}
