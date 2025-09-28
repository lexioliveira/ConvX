# ConvX - Unit Converter

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![iOS](https://img.shields.io/badge/iOS-14.0+-blue.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-4.0+-green.svg)
![Architecture](https://img.shields.io/badge/Architecture-MVVM%20%2B%20Clean-blue.svg)
![Pattern](https://img.shields.io/badge/Pattern-Clean%20Architecture-green.svg)

ConvX is an iOS app developed in SwiftUI that provides precise conversions between different units of measurement. The project demonstrates modern iOS development practices using **MVVM (Model-View-ViewModel)** pattern combined with **Clean Architecture** principles, showcasing separation of concerns, dependency injection, and testable code structure.

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

## 🏗️ Architecture Overview

ConvX implements **MVVM (Model-View-ViewModel)** pattern with **Clean Architecture** principles, ensuring separation of concerns, testability, and maintainability.

### Architecture Layers

```
┌─────────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                          │
│  ┌─────────────────┐    ┌─────────────────────────────────┐    │
│  │   ContentView   │    │        ConversionView           │    │
│  │                 │    │                                 │    │
│  │ • Dependency    │    │ • SwiftUI Components           │    │
│  │   Injection     │    │ • Form Sections                │    │
│  │ • App Entry     │    │ • Picker Views                 │    │
│  │   Point         │    │ • Text Fields                  │    │
│  └─────────────────┘    └─────────────────────────────────┘    │
│           │                              │                     │
│           │                              │ @StateObject        │
│           │                              ▼                     │
│           │              ┌─────────────────────────────────┐    │
│           │              │     ConversionViewModel         │    │
│           │              │                                 │    │
│           │              │ • @Published Properties        │    │
│           │              │ • State Management             │    │
│           │              │ • User Input Handling          │    │
│           │              │ • Reactive Updates             │    │
│           │              └─────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────┘
                                │
                                │ Depends on
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                      DOMAIN LAYER                              │
│  ┌─────────────────┐    ┌─────────────────────────────────┐    │
│  │   Use Cases     │    │         Entities                │    │
│  │                 │    │                                 │    │
│  │ • ConvertValue  │    │ • ConversionType               │    │
│  │   UseCase       │    │ • TemperatureUnit              │    │
│  │ • GetAvailable  │    │ • LengthUnit                   │    │
│  │   UnitsUseCase  │    │ • TimeUnit                     │    │
│  │                 │    │ • VolumeUnit                   │    │
│  │ • Business      │    │ • ConversionRequest            │    │
│  │   Logic         │    │ • ConversionResult             │    │
│  └─────────────────┘    └─────────────────────────────────┘    │
│           │                              │                     │
│           │              ┌─────────────────────────────────┐    │
│           │              │     Repository Protocol         │    │
│           │              │                                 │    │
│           │              │ • ConversionRepository         │    │
│           │              │ • Interface Definition         │    │
│           │              │ • Abstraction Layer            │    │
│           │              └─────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────┘
                                │
                                │ Implemented by
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                       DATA LAYER                               │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │           ConversionRepositoryImpl                      │    │
│  │                                                         │    │
│  │ • Temperature Conversions                              │    │
│  │ • Length Conversions                                   │    │
│  │ • Time Conversions                                     │    │
│  │ • Volume Conversions                                   │    │
│  │ • Data Formatting                                      │    │
│  │ • Business Rules Implementation                        │    │
│  └─────────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────┘
```

### MVVM Pattern Implementation

- **Model**: Domain entities and use cases
- **View**: SwiftUI views (`ConversionView`)
- **ViewModel**: `ConversionViewModel` with `@Published` properties
- **Binding**: `@StateObject` and `@Published` for reactive updates

### Clean Architecture Principles

- **Dependency Rule**: Dependencies point inward (Data → Domain ← Presentation)
- **Single Responsibility**: Each class has one reason to change
- **Open/Closed**: Open for extension, closed for modification
- **Interface Segregation**: Small, focused protocols
- **Dependency Inversion**: Depend on abstractions, not concretions

## 🛠️ Technologies & Patterns Used

### Core Technologies
- **SwiftUI**: Declarative framework for user interface
- **Swift 5.0+**: Modern and safe programming language
- **iOS 14.0+**: Target platform
- **Xcode**: Integrated development environment

### Architecture Patterns
- **MVVM (Model-View-ViewModel)**: Separation of UI and business logic
- **Clean Architecture**: Layered architecture with dependency inversion
- **Repository Pattern**: Abstraction of data access layer
- **Use Case Pattern**: Encapsulation of business logic
- **Dependency Injection**: Loose coupling between components
- **Protocol-Oriented Programming**: Flexible and testable design

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

- **State Management**: Use of `@StateObject` and `@Published` for reactive state management
- **Binding**: Bidirectional connection between interface and data
- **Modifiers**: Application of styles and behaviors
- **Navigation**: Navigation implementation with `NavigationStack`
- **Reactive Programming**: Real-time UI updates through `@Published` properties

### Architecture Patterns

- **MVVM Pattern**: Clear separation between View, ViewModel, and Model
- **Clean Architecture**: Three-layer architecture (Presentation, Domain, Data)
- **Repository Pattern**: Abstract data access through protocols
- **Use Case Pattern**: Encapsulated business logic
- **Dependency Injection**: Loose coupling and testability

### Design Patterns

- **Protocol-Oriented Programming**: Use of protocols for flexibility and abstraction
- **Enum-Driven UI**: Interface based on typed enums
- **Separation of Concerns**: Each layer has a single responsibility
- **Observer Pattern**: Reactive updates through `@Published` properties

### Best Practices

- **Type Safety**: Use of enums to prevent errors
- **Code Organization**: Logical grouping by architectural layers
- **Error Handling**: Treatment of invalid values and edge cases
- **Performance**: Optimized calculations and responsive interface
- **Testability**: Mockable dependencies for unit testing
- **Maintainability**: Clear boundaries and single responsibility principle

## 🔧 Code Structure

```
ConvX/
├── Domain/                    # Business Logic Layer
│   ├── Entities/
│   │   └── ConversionType.swift
│   ├── Repositories/
│   │   └── ConversionRepository.swift
│   └── UseCases/
│       ├── ConvertValueUseCase.swift
│       └── GetAvailableUnitsUseCase.swift
├── Data/                      # Data Layer
│   └── Repositories/
│       └── ConversionRepositoryImpl.swift
├── Presentation/              # Presentation Layer
│   ├── ViewModels/
│   │   └── ConversionViewModel.swift
│   └── Views/
│       └── ConversionView.swift
├── ConvXApp.swift            # Application entry point
├── ContentView.swift         # Main entry point with dependency injection
└── Assets.xcassets/          # Visual resources
```

### Main Components

#### Domain Layer
- **ConversionType**: Main enum that defines conversion types
- **TemperatureUnit, LengthUnit, etc.**: Specific enums for each type
- **ConversionRequest/Result**: Data models for conversion operations
- **Use Cases**: Business logic encapsulation
- **Repository Protocol**: Data access abstraction

#### Data Layer
- **ConversionRepositoryImpl**: Concrete implementation of conversion logic
- **Conversion Functions**: Specialized methods for each conversion type

#### Presentation Layer
- **ConversionViewModel**: State management and user interaction handling
- **ConversionView**: SwiftUI interface components
- **ContentView**: Dependency injection setup

## 🎨 User Interface

The app presents a clean and intuitive interface with:

- **Form Sections**: Clear organization of options
- **Segmented Pickers**: Easy unit selection
- **Real-time Updates**: Instant results through reactive programming
- **Keyboard Optimization**: Numeric keyboard for efficient input
- **MVVM Integration**: Seamless data binding between View and ViewModel

## 🧪 Testing & Quality

### Architecture Benefits for Testing

- **Unit Testing**: Each layer can be tested independently
- **Mock Dependencies**: Easy creation of test doubles
- **Isolated Business Logic**: Use cases can be tested without UI
- **Protocol-based Testing**: Mock implementations for repositories

### Code Quality

- **SOLID Principles**: Applied throughout the architecture
- **Clean Code**: Readable and maintainable code structure
- **Type Safety**: Compile-time error prevention
- **Error Handling**: Comprehensive edge case coverage

## 📄 License

This project is developed for educational purposes and demonstration of modern iOS development practices, including SwiftUI, MVVM, and Clean Architecture.

## 👨‍💻 Author

**Lexi Oliveira**
- Project created on 27/09/2025
- First contact with SwiftUI

---

*ConvX represents a practical introduction to modern iOS development with SwiftUI, MVVM, and Clean Architecture, demonstrating how to create elegant, maintainable, and testable applications using industry best practices and architectural patterns.*
