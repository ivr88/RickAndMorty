import SwiftUI

struct GenderView: View {
    var gender: String
    
    var body: some View {
        Text(gender)
            .font(.customFontRegular(size: 12))
    }
}
