import SwiftUI

class RowViewModel: ObservableObject {
    let character: Result

    init(character: Result) {
        self.character = character
    }

    var statusColor: Color {
        Color(character.statusColor)
    }
}
