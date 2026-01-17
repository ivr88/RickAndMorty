import Foundation
import Network

@Observable
class NetworkMonitor: ObservableObject {
    
    private let monitor = NWPathMonitor()
    
    private let queue = DispatchQueue(label: "Monitor")
    
    var isConnected = true
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
