import Network

final class NetworkChecker {
    static let shared = NetworkChecker()

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    private(set) var isConnected: Bool = true

    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
}
