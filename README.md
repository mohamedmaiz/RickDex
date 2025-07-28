# RickDex - Rick and Morty Characters App

An iOS application built with **SwiftUI**, using the [Rick and Morty API](https://rickandmortyapi.com/) to explore character details.  
Structured with **Clean MVVM**, **modular folder architecture**, and modern SwiftUI patterns.


---
## 📦 Screenshots

| Loading Shimmer        | Home        |  Details         |
|-------------|---------------|------------------|
| <img width="1206" height="2622" alt="simulator_screenshot_EE883FEB-2746-4593-B0B3-42FB35CB6E19" src="https://github.com/user-attachments/assets/ed621964-832a-40e8-a31d-1517046bbcc1" /> | <img width="1206" height="2622" alt="simulator_screenshot_AD8E2094-441D-4A8A-A8AA-699977EFDA77" src="https://github.com/user-attachments/assets/f6122543-05ee-497c-b28d-31616b342dcf" /> | <img width="1206" height="2622" alt="simulator_screenshot_695F5E83-0E27-48F5-9E09-080A3CB71D6B" src="https://github.com/user-attachments/assets/8fbe6520-0e46-4939-9599-7a884ad63d72" /> |

| Pagination Loading        | Empty State        |  Error state         |
|-------------|---------------|------------------|
| <img width="1206" height="2622" alt="simulator_screenshot_D4C2EFDE-27D3-4B81-A321-489F2F5482A7" src="https://github.com/user-attachments/assets/fc90fcc0-66a5-4230-87db-756ec17d397e" /> | <img width="1206" height="2622" alt="simulator_screenshot_FC72C8C7-4E20-4BAE-8EA5-0FD228A04491" src="https://github.com/user-attachments/assets/bae092da-e2a1-43f8-b05b-fbe14ea1b623" /> | <img width="1206" height="2622" alt="simulator_screenshot_EC84A63E-AFEC-421E-8C9B-092EFEE7608E" src="https://github.com/user-attachments/assets/7ad7d3e3-75e3-4907-a6e6-69517cad6227" /> |

## 🎥 Demo


https://github.com/user-attachments/assets/1ecbb75a-dd2e-4625-8703-64602ae4eccd


---
## 📱 Features

- 🔍 Search characters by name with debounce
- 💾 Pagination and infinite scroll
- 🔄 Pull-to-refresh
- 🌐 Network image loading with shimmer placeholders
- 🚨 Graceful error handling & empty state views
- 📊 Detail screens with metadata & episodes
- 💡 Custom reusable components & styling
- 📦 Built with Swift Package Manager

---
## 📦 Tech Stack

| Layer        | Tech                  |
|--------------|------------------------|
| UI           | SwiftUI, SF Symbols, Shimmer Effects|
| Architecture | Modular Clean Architecture (MVVM pattern)|
| State        | ObservableObject, @Published, Combine|
| Image cashing & loading | SDWebImage                  |
| Network      | URLSession, async/await       |
| Language     | Kotlin                |



## 🏗 Architecture

This app follows a **modular Clean MVVM architecture**, separating concerns across multiple layers:

```
RickDex/
  │
  ├── App/                             # Entry point, main app config
  │
  ├── Core/                            # Shared reusable layers
  │   ├── Networking/                  # API client, endpoints, error handling
  │   ├── Style/                       # Fonts, colors, corner radius, spacing
  │   ├── UI/                          # Reusable views: loaders, error views, etc.
  │   └── Utilities/                   # Helpers like DateFormatter, formatters
  │
  └──  Features/
            └── Home/                  # Feature-based modular folder
            ├── Data/                  # Models, Responses, API service
            ├── ViewModel/             # Business logic (ObservableObject)
            └── View/                  # SwiftUI views
                  ├── Components/      # Reusable UI components (Home + Detail)
                  └── Screens/         # Screen containers (HomeScreen, DetailScreen)
```



## 📡 Networking

The networking layer uses `URLSession`, with a clean abstraction over `APIClient`, `Endpoints`, and error parsing. Supports:

- ✅ Query parameters
- ✅ Custom URLs for pagination
- ✅ JSON decoding
- ✅ Error model handling

---

## ✨ UI & UX

- **Custom Views**: `NetworkImageView`, `ShimmerView`, `EmptyStateView`, `ErrorView`
- **Styling**: Centralized in `Style/` for fonts, colors, spacing
- **Accessibility**: Basic support for readable text and scalable layout

---


## 🔧 Requirements

- iOS 16.0+
- Swift 5.9+
- Xcode 15+

---

## 🧪 How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/mohamedmaiz/RickDex

2. Open RickDex.xcodeproj or RickDex.xcworkspace in Xcode.
3. Run on simulator or real device.
