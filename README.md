# TodoList-SwiftfulThinking
![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![iOS](https://img.shields.io/badge/iOS-17+-blue.svg)
![Xcode](https://img.shields.io/badge/Xcode-15+-lightgrey.svg)


## Overview
This repository contains the source code for a Todo List application built as part of the SwiftUI Bootcamp by [SwiftfulThinking](https://www.youtube.com/@SwiftfulThinking). The app is designed for iOS 17 and above, utilizing modern SwiftUI features, clean code practices, and efficient data management.

## Features

- **SwiftUI with Observable Macro**: Leverages the `@Observable` macro for reactive state management.
- **Dynamic List**: Displays a list of tasks with the ability to add, edit, and delete items.
- **Clean Code**: Follows SwiftUI best practices for maintainable and readable code.
- **Data Persistence**: Uses `UserDefaults` for lightweight storage of tasks.

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Getting Started

### Prerequisites

- Ensure you have Xcode 15 or later installed.
- An iOS device or simulator running iOS 17 or later.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/NandaMocha/TodoList-SwiftfulThinking.git
   ```

2. **Open in Xcode**:
   - Navigate to the cloned repository folder.
   - Open the `.xcodeproj` file in Xcode.

3. **Build and Run**:
   - Select your target device or simulator.
   - Press `Cmd + R` to build and run the application.

## Usage

- **Add a Task**: Use the input field to create a new task and add it to the list.
- **Edit a Task**: Tap on a task to modify its details.
- **Delete a Task**: Swipe left on a task to remove it from the list.
- **Persistent Storage**: Tasks are automatically saved using `UserDefaults` and persist across app launches.

## Project Structure

- `TodoListApp.swift`: Main app entry point.
- `View/`: Contains SwiftUI views for the app's UI.
- `Model/`: Defines the data models and business logic.
- `ViewModel/`: Manages the app's state using the `@Observable` macro.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add your feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a pull request.

## Acknowledgments

- Built as part of the [SwiftfulThinking SwiftUI Bootcamp](https://www.youtube.com/@SwiftfulThinking).
- Thanks to the SwiftUI community for inspiration and resources.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
