# Rick and Morty API Swift App

This is a simple SwiftUI app that fetches and displays character and episode data from the **Rick and Morty API**. The app provides an interface to explore characters and episodes from the show, with details like the characters' names, origins, locations, and episodes they appear in.

## Architecture: MVVM

The app follows the **MVVM (Model-View-ViewModel)** design pattern for better code organization and testability:

- **Model**: Represents the data objects, like `Character` and `Episode`. These are fetched and parsed from the API.
- **View**: The user interface of the app, built using **SwiftUI**. The view is responsible for displaying data from the view model and reacting to user interactions.
- **ViewModel**: Acts as the intermediary between the model and the view. It manages the business logic, handles fetching data from the API, and updates the view when the data changes.

## Features

- **Character List**: Displays a list of characters from the show, including their names and other basic details.
- **Character Details View**: Tap on a character to view more information, including their status, species, gender, origin, and location.
- **Episode View**: Displays a list of episodes for a selected character, fetched from a new API method.

## Screenshots

*Add screenshots here if applicable.*

## API Endpoints

- **Character API**: `/api/character`
- **Episode API**: `/api/episode`

## Technologies Used

- **Swift**: The app is built using Swift.
- **SwiftUI**: The app uses SwiftUI for the user interface.
- **Combine**: Combine framework is used for managing API data fetching.
- **JSONDecoder**: Decodes the JSON response from the API into usable data.

## Installation

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/Rick-Morty.git
