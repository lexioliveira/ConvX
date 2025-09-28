# ConvX - Unit Converter

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![iOS](https://img.shields.io/badge/iOS-14.0+-blue.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-4.0+-green.svg)

ConvX is an iOS app developed in SwiftUI that provides precise conversions between different units of measurement. The project demonstrates fundamental SwiftUI concepts, including protocols, enums, state management, and declarative interface.

## 🚀 Features

### Supported Conversion Types

- **🌡️ Temperature**: Celsius (°C), Fahrenheit (°F), Kelvin (K)
- **📏 Length**: Meters (m), Kilometers (km), Feet (ft), Yards (yd), Miles (mi)
- **⏰ Time**: Seconds (s), Minutes (min), Hours (h), Days (d)
- **📦 Volume**: Milliliters (mL), Liters (L), Cups (cup), Pints (pt), Gallons (gal)

### Interface Features

- **Intuitive Interface**: Clean and modern design using SwiftUI
- **Real-time Conversion**: Results updated instantly
- **Smart Selection**: Prevention of identical unit selection
- **Numeric Keyboard**: Optimized for decimal value input
- **Smooth Navigation**: Fluid transitions between different conversion types

## 🏗️ Project Architecture

### Protocols and Enums

```swift
protocol ConvertionOption: CaseIterable {
    var title: String { get }
}
```

The project uses a `ConvertionOption` protocol that ensures consistency between different conversion types, allowing:

- **Extensibility**: Easy addition of new conversion types
- **Consistency**: Uniform interface for all units
- **Type Safety**: Safe compilation with typed enums

### Conversion Structure

Each conversion type follows a consistent pattern:
1. **Base Unit Conversion**: All units are converted to a standard unit
2. **Destination Conversion**: The base unit is converted to the destination unit
3. **Precision**: Results formatted with 2 decimal places

## 🛠️ Technologies Used

- **SwiftUI**: Declarative framework for user interface
- **Swift 5.0+**: Modern and safe programming language
- **iOS 14.0+**: Target platform
- **Xcode**: Integrated development environment

## 📱 How to Run

### Prerequisites

- macOS with Xcode 14.0 or higher
- iOS Simulator or iOS device 14.0+

### Installation

1. Clone the repository:
```bash
git clone [REPOSITORY_URL]
cd ConvX
```

2. Open the project in Xcode:
```bash
open ConvX.xcodeproj
```

3. Select a simulator or target device
4. Press `Cmd + R` to run the application

## 🎯 Demonstrated Concepts

### Advanced SwiftUI

- **State Management**: Use of `@State` for local state management
- **Binding**: Bidirectional connection between interface and data
- **Modifiers**: Application of styles and behaviors
- **Navigation**: Navigation implementation with `NavigationStack`

### Design Patterns

- **Protocol-Oriented Programming**: Use of protocols for flexibility
- **Enum-Driven UI**: Interface based on typed enums
- **Separation of Concerns**: Conversion logic separated from interface

### Best Practices

- **Type Safety**: Use of enums to prevent errors
- **Code Organization**: Functions grouped by functionality
- **Error Handling**: Treatment of invalid values
- **Performance**: Optimized calculations and responsive interface

## 🔧 Code Structure

```
ConvX/
├── ConvXApp.swift          # Application entry point
├── ContentView.swift       # Main interface and conversion logic
└── Assets.xcassets/        # Visual resources
```

### Main Components

- **ConversionType**: Main enum that defines conversion types
- **TemperatureOptions, LengthOptions, etc.**: Specific enums for each type
- **ContentView**: Main view with all interface and conversion logic
- **Conversion Functions**: Specialized methods for each conversion type

## 🎨 User Interface

The app presents a clean and intuitive interface with:

- **Form Sections**: Clear organization of options
- **Segmented Pickers**: Easy unit selection
- **Real-time Updates**: Instant results
- **Keyboard Optimization**: Numeric keyboard for efficient input

## 📄 License

This project is developed for educational purposes and demonstration of SwiftUI concepts.

## 👨‍💻 Author

**Lexi Oliveira**
- Project created on 27/09/2025
- First contact with SwiftUI

---

*ConvX represents a practical introduction to modern iOS development with SwiftUI, demonstrating how to create elegant and functional applications using the platform's best practices.*
