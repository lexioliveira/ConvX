# ConvX - Conversor de Unidades

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![iOS](https://img.shields.io/badge/iOS-14.0+-blue.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-4.0+-green.svg)

ConvX é um aplicativo iOS desenvolvido em SwiftUI que oferece conversões precisas entre diferentes unidades de medida. O projeto demonstra conceitos fundamentais de SwiftUI, incluindo protocolos, enums, state management e interface declarativa.

## 🚀 Funcionalidades

### Tipos de Conversão Suportados

- **🌡️ Temperatura**: Celsius (°C), Fahrenheit (°F), Kelvin (K)
- **📏 Comprimento**: Metros (m), Quilômetros (km), Pés (ft), Jardas (yd), Milhas (mi)
- **⏰ Tempo**: Segundos (s), Minutos (min), Horas (h), Dias (d)
- **📦 Volume**: Mililitros (mL), Litros (L), Copos (cup), Pintas (pt), Galões (gal)

### Características da Interface

- **Interface Intuitiva**: Design limpo e moderno usando SwiftUI
- **Conversão em Tempo Real**: Resultados atualizados instantaneamente
- **Seleção Inteligente**: Prevenção de seleção de unidades idênticas
- **Teclado Numérico**: Otimizado para entrada de valores decimais
- **Navegação Fluida**: Transições suaves entre diferentes tipos de conversão

## 🏗️ Arquitetura do Projeto

### Protocolos e Enums

```swift
protocol ConvertionOption: CaseIterable {
    var title: String { get }
}
```

O projeto utiliza um protocolo `ConvertionOption` que garante consistência entre diferentes tipos de conversão, permitindo:

- **Extensibilidade**: Fácil adição de novos tipos de conversão
- **Consistência**: Interface uniforme para todas as unidades
- **Type Safety**: Compilação segura com enums tipados

### Estrutura de Conversão

Cada tipo de conversão segue um padrão consistente:
1. **Conversão para Unidade Base**: Todas as unidades são convertidas para uma unidade padrão
2. **Conversão para Destino**: A unidade base é convertida para a unidade de destino
3. **Precisão**: Resultados formatados com 2 casas decimais

## 🛠️ Tecnologias Utilizadas

- **SwiftUI**: Framework declarativo para interface do usuário
- **Swift 5.0+**: Linguagem de programação moderna e segura
- **iOS 14.0+**: Plataforma de destino
- **Xcode**: Ambiente de desenvolvimento integrado

## 📱 Como Executar

### Pré-requisitos

- macOS com Xcode 14.0 ou superior
- iOS Simulator ou dispositivo iOS 14.0+

### Instalação

1. Clone o repositório:
```bash
git clone [URL_DO_REPOSITORIO]
cd ConvX
```

2. Abra o projeto no Xcode:
```bash
open ConvX.xcodeproj
```

3. Selecione um simulador ou dispositivo de destino
4. Pressione `Cmd + R` para executar o aplicativo

## 🎯 Conceitos Demonstrados

### SwiftUI Avançado

- **State Management**: Uso de `@State` para gerenciamento de estado local
- **Binding**: Conexão bidirecional entre interface e dados
- **Modifiers**: Aplicação de estilos e comportamentos
- **Navigation**: Implementação de navegação com `NavigationStack`

### Padrões de Design

- **Protocol-Oriented Programming**: Uso de protocolos para flexibilidade
- **Enum-Driven UI**: Interface baseada em enums tipados
- **Separation of Concerns**: Lógica de conversão separada da interface

### Boas Práticas

- **Type Safety**: Uso de enums para prevenir erros
- **Code Organization**: Funções agrupadas por funcionalidade
- **Error Handling**: Tratamento de valores inválidos
- **Performance**: Cálculos otimizados e interface responsiva

## 🔧 Estrutura do Código

```
ConvX/
├── ConvXApp.swift          # Ponto de entrada da aplicação
├── ContentView.swift       # Interface principal e lógica de conversão
└── Assets.xcassets/        # Recursos visuais
```

### Principais Componentes

- **ConversionType**: Enum principal que define tipos de conversão
- **TemperatureOptions, LengthOptions, etc.**: Enums específicos para cada tipo
- **ContentView**: View principal com toda a lógica de interface e conversão
- **Funções de Conversão**: Métodos especializados para cada tipo de conversão

## 🎨 Interface do Usuário

O aplicativo apresenta uma interface limpa e intuitiva com:

- **Form Sections**: Organização clara das opções
- **Segmented Pickers**: Seleção fácil de unidades
- **Real-time Updates**: Resultados instantâneos
- **Keyboard Optimization**: Teclado numérico para entrada eficiente

## 🚀 Próximos Passos

- [ ] Adicionar mais tipos de conversão (peso, área, velocidade)
- [ ] Implementar histórico de conversões
- [ ] Adicionar favoritos para conversões frequentes
- [ ] Suporte a temas (claro/escuro)
- [ ] Internacionalização (i18n)
- [ ] Testes unitários para funções de conversão

## 📄 Licença

Este projeto é desenvolvido para fins educacionais e demonstração de conceitos SwiftUI.

## 👨‍💻 Autor

**Lexi Oliveira**
- Projeto criado em 27/09/2025
- Primeiro contato com SwiftUI

---

*ConvX representa uma introdução prática ao desenvolvimento iOS moderno com SwiftUI, demonstrando como criar aplicações elegantes e funcionais usando as melhores práticas da plataforma.*
