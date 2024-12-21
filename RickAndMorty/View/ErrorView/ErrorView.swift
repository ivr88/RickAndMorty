import SwiftUI

struct ErrorView: View {
    
    @ObservedObject private var networkManager = NetworkMonitor()
    
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            Color
                .black
                .ignoresSafeArea()
            
            VStack (spacing: 15) {
                Group {
                    Image("errorImage")
                        .frame(width: 263, height: 263)
                    Text("Network Error")
                        .font(.customFontSemiBold(size: 28))
                    Text("There was an error connecting. Please check your internet.")
                        .foregroundStyle(Color.customGray)
                        .font(.customFontRegular(size: 16))
                        .frame(width: 253)
                }
                .multilineTextAlignment(.center)
                
                Button {
                    self.showAlert =  true
                } label: {
                    Text("Retry")
                        .font(.customFontMedium(size: 18))
                        .padding(.horizontal, 87.5)
                        .padding(.vertical, 10)
                }
                .background(Color.customTurquoise)
                .clipShape(.rect(cornerRadius: 16))
            }
            .foregroundStyle(.white)
            .alert(isPresented: $showAlert) {
            if networkManager.isConnected {
                return Alert(title: Text("Success!"), message: Text("The network request can be performed"), dismissButton: .default(Text("OK")))
                }
                return Alert(title: Text("No internet connection"), message: Text("Please, enable wi-fi or Celluar data"), dismissButton: .default(Text("Cancel")))
            }
        }
    }
}
