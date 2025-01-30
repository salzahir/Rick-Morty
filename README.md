# Rick and Morty API iOS App

This is an iOS app that interacts with the [Rick and Morty API](https://rickandmortyapi.com/), allowing users to view details about characters, including their names, status, species, and more. The app displays a list of characters, which can be tapped to see detailed information on each one.

## Features

- **Character List:** View a list of characters from the Rick and Morty universe.
- **Character Details:** Tap on any character to view more information, including origin, location, and episodes.
- **API Integration:** Fetches data from the Rick and Morty API and displays character data dynamically.
- **Detail View:** Each character has a detailed view showing their ID, name, status, species, type, gender, origin, location, and episodes.
  
## Technologies Used

- **Swift:** The app is built using Swift, leveraging the latest features of SwiftUI for a modern and responsive UI.
- **SwiftUI:** UI framework used to build the user interface.
- **Asynchronous Data Fetching:** Fetching character data asynchronously using `async/await`.
- **JSON Parsing:** Data from the API is parsed into Swift structs using the `Codable` protocol.
  
## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/salzahir/Rick-Morty.git
