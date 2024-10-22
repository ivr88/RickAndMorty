import SwiftUI

struct NameView: View {
    var name: String
    
    var body: some View {
        Text (name)
            .font(.custom("IBMPlexSans-Medium", size: 18))
    }
}
