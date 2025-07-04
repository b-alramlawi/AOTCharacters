<h1 align="center">Attack on Titan Characters App</h1>

![cover](https://github.com/user-attachments/assets/c5156007-9398-487b-9737-99af3a688cbe)

## Description

A simple iOS app built with SwiftUI to fetch and display information about characters from *Attack on Titan*. The app uses Apple's modern UI framework, SwiftUI, and follows a clean architecture approach to deliver a minimal, elegant, and responsive user experience.

## App Images  
Splash | All | All  
--- | --- | ---  
![aot1](https://github.com/user-attachments/assets/07cca8d3-065d-4797-a27f-de5da484e7c0) | ![aot2](https://github.com/user-attachments/assets/11586e6d-abfe-43af-809e-d5d006386716) | ![aot3](https://github.com/user-attachments/assets/ea5bc6c3-1c14-4c0c-8d3e-69df2459dd87)

Details | Search | Not Found  
--- | --- | ---  
![aot4](https://github.com/user-attachments/assets/33c528a9-40e0-4b20-8ec8-d36e075488b9) | ![aot5](https://github.com/user-attachments/assets/4a27c232-3ecd-4a42-98ee-65f95fe46b73) | ![aot6](https://github.com/user-attachments/assets/9ea56699-1c1a-492f-a388-2f365d296a64)


<br />

## Project Structure 📁

This SwiftUI project is built using **Clean Architecture**, ensuring modularity, maintainability, and testability. The structure is organized as follows:

- `Core/`: Contains networking logic (`APIClient`, endpoints, and constants) shared across the app.
- `Data/`: Includes Data Transfer Objects (DTOs) and repository implementations that fetch and map API data.
- `Domain/`: Defines business logic, including `Entities`, `UseCases`, and `RepositoryProtocols` for abstraction.
- `Presentation/`: Organized by feature (`Characters`, `CharacterDetails`, `Splash`), each with:
  - `Views`: SwiftUI views for screens and subcomponents.
  - `ViewModels`: Logic and state for each view, using ObservableObject.
  - `Components`: Reusable UI components (e.g., rows, image views, search bars).
- `Resources/`: Contains app assets (icons, splash image) and localized strings.
- `AOTCharactersApp.swift`: The main entry point initializing the app.

This structure promotes a clear separation of concerns across UI, domain logic, and data layers, making it easier to develop and scale features independently.

![CleanArchitecture](https://github.com/user-attachments/assets/e0695060-f965-45c4-ae2b-d3f30cce9df8)

## Technologies 🛠️

This project uses modern iOS technologies to deliver a robust and user-friendly experience:

- **Swift**: A powerful and intuitive language for iOS development.
- **SwiftUI**: A declarative UI framework from Apple for building interfaces across all Apple platforms.
- **MVVM**: A design pattern that separates business logic from UI using ViewModels.
- **Clean Architecture**: Modular structure with Data, Domain, and Presentation layers.
- **Combine** *(optional)*: For reactive state management (can be extended).
- **URLSession**: Native networking to interact with the Attack on Titan API.
- **Async/Await**: For clean and efficient asynchronous programming.
- **SF Symbols and Material Design**: For consistent, modern UI components.

These technologies provide a scalable, efficient, and maintainable foundation for iOS app development.
