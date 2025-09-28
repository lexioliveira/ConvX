//
//  ContentView.swift
//  ConvX
//
//  Created by Lexi Oliveira on 27/09/25.
//

import SwiftUI

// MARK: - Main Content View

struct ContentView: View {
    var body: some View {
        // Dependency Injection Setup
        let repository = ConversionRepositoryImpl()
        let convertUseCase = ConvertValueUseCaseImpl(repository: repository)
        let getUnitsUseCase = GetAvailableUnitsUseCaseImpl(repository: repository)
        let viewModel = ConversionViewModel(
            convertValueUseCase: convertUseCase,
            getAvailableUnitsUseCase: getUnitsUseCase
        )
        
        return ConversionView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
