import Foundation

func formatDate(_ isoDate: String) -> String {
    let isoFormatter = ISO8601DateFormatter()
    isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    
    let displayFormatter = DateFormatter()
    displayFormatter.dateStyle = .long // e.g., Jan 10, 2018
    displayFormatter.timeStyle = .none   // omit time
    displayFormatter.locale = Locale.current
    
    if let date = isoFormatter.date(from: isoDate) {
        return displayFormatter.string(from: date)
    } else {
        return "Invalid date"
    }
}
