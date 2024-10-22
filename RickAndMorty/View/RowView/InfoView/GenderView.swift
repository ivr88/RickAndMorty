import SwiftUI

struct GenderView: View {
    var gender: String
    
    var body: some View {
        Text(gender)
            .font(.custom("IBMPlexSans-Regular", size: 12))
    }
}
