# MVVM + Clean Architecture - ConvX

## Arquitetura em Camadas

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

## Fluxo de Dados

```
User Input → View → ViewModel → Use Case → Repository → Result
     ↑                                                      │
     └────────────────── UI Update ←────────────────────────┘
```

## Dependências

```
Presentation Layer
       ↓
   Domain Layer
       ↓
    Data Layer
```

## Componentes Detalhados

### 1. Presentation Layer
- **ContentView**: Ponto de entrada da aplicação
- **ConversionView**: Interface SwiftUI
- **ConversionViewModel**: Gerenciamento de estado e lógica de apresentação

### 2. Domain Layer
- **Entities**: Modelos de dados e enums
- **Use Cases**: Lógica de negócio
- **Repository Protocol**: Interface para acesso a dados

### 3. Data Layer
- **Repository Implementation**: Implementação concreta das regras de negócio

## Benefícios da Arquitetura

1. **Separação de Responsabilidades**: Cada camada tem uma função específica
2. **Testabilidade**: Fácil criação de mocks e testes unitários
3. **Manutenibilidade**: Mudanças isoladas em cada camada
4. **Escalabilidade**: Fácil adição de novas funcionalidades
5. **Reutilização**: Componentes podem ser reutilizados
6. **Flexibilidade**: Troca de implementações sem afetar outras camadas
