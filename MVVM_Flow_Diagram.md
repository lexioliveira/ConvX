# Fluxo MVVM - ConvX

## Diagrama de Sequência

```
User                    View                ViewModel              UseCase              Repository
 │                       │                     │                     │                     │
 │ 1. Selects Unit       │                     │                     │                     │
 ├──────────────────────►│                     │                     │                     │
 │                       │ 2. onSourceUnitChanged()                  │                     │
 │                       ├────────────────────►│                     │                     │
 │                       │                     │ 3. performConversion()                    │
 │                       │                     ├────────────────────►│                     │
 │                       │                     │                     │ 4. execute(request) │
 │                       │                     │                     ├────────────────────►│
 │                       │                     │                     │                     │ 5. convert()
 │                       │                     │                     │                     │
 │                       │                     │                     │ 6. ConversionResult  │
 │                       │                     │                     │◄────────────────────┤
 │                       │                     │ 7. result = formattedValue                │
 │                       │                     │◄────────────────────┤                     │
 │                       │ 8. @Published result updates             │                     │
 │                       │◄────────────────────┤                     │                     │
 │ 9. UI Updates         │                     │                     │                     │
 │◄──────────────────────┤                     │                     │                     │
```

## Estrutura de Dependências

```
┌─────────────────────────────────────────────────────────────────┐
│                    DEPENDENCY INJECTION                        │
│                                                                 │
│  ContentView                                                   │
│  ├── Creates: ConversionRepositoryImpl                         │
│  ├── Creates: ConvertValueUseCaseImpl                          │
│  ├── Creates: GetAvailableUnitsUseCaseImpl                     │
│  └── Creates: ConversionViewModel                              │
│                                                                 │
│  ConversionViewModel                                            │
│  ├── Depends on: ConvertValueUseCase (protocol)                │
│  └── Depends on: GetAvailableUnitsUseCase (protocol)           │
│                                                                 │
│  ConvertValueUseCaseImpl                                        │
│  └── Depends on: ConversionRepository (protocol)               │
│                                                                 │
│  ConversionRepositoryImpl                                       │
│  └── Implements: ConversionRepository (protocol)               │
└─────────────────────────────────────────────────────────────────┘
```

## Padrões de Design Aplicados

### 1. MVVM (Model-View-ViewModel)
```
Model: Domain Entities + Use Cases
View: SwiftUI Views
ViewModel: ConversionViewModel
```

### 2. Clean Architecture
```
Presentation → Domain ← Data
     ↓           ↓        ↓
   Views    Use Cases  Repository
```

### 3. Dependency Injection
```
High-level modules don't depend on low-level modules
Both depend on abstractions (protocols)
```

### 4. Repository Pattern
```
Abstracts data access logic
Provides a uniform interface for data operations
```

### 5. Use Case Pattern
```
Encapsulates business logic
Single responsibility principle
```

## Responsabilidades por Camada

### Presentation Layer
- **Responsabilidade**: Interface do usuário e interação
- **Componentes**: Views, ViewModels
- **Dependências**: Domain Layer (Use Cases)

### Domain Layer
- **Responsabilidade**: Lógica de negócio e regras
- **Componentes**: Entities, Use Cases, Repository Protocols
- **Dependências**: Nenhuma (camada mais interna)

### Data Layer
- **Responsabilidade**: Implementação de regras e acesso a dados
- **Componentes**: Repository Implementations
- **Dependências**: Domain Layer (implementa protocols)

## Vantagens da Implementação

1. **Testabilidade**: Cada camada pode ser testada independentemente
2. **Manutenibilidade**: Mudanças isoladas em cada camada
3. **Escalabilidade**: Fácil adição de novas funcionalidades
4. **Reutilização**: Use cases e repositories podem ser reutilizados
5. **Flexibilidade**: Troca de implementações sem afetar outras camadas
6. **Separação de Responsabilidades**: Cada classe tem uma única responsabilidade
