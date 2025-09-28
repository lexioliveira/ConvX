//
//  ConversionView.swift
//  ConvX
//
//  Created by Lexi Oliveira on 27/09/25.
//

import SwiftUI

// MARK: - Main Conversion View

struct ConversionView: View {
    @StateObject private var viewModel: ConversionViewModel
    
    init(viewModel: ConversionViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                conversionTypeSection
                sourceUnitSection
                destinationUnitSection
                inputValueSection
                resultSection
            }
            .navigationTitle("ConvX")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: - View Components
    
    private var conversionTypeSection: some View {
        Section("Select the conversion type:") {
            Picker("Conversion type", selection: $viewModel.selectedConversionType) {
                ForEach(ConversionType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .onChange(of: viewModel.selectedConversionType) { _, newType in
                viewModel.onConversionTypeChanged(newType)
            }
        }
    }
    
    private var sourceUnitSection: some View {
        Section("From") {
            Picker("From", selection: $viewModel.sourceUnit) {
                ForEach(viewModel.availableSourceUnits, id: \.self) { unit in
                    Text(unit)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: viewModel.sourceUnit) { _, newUnit in
                viewModel.onSourceUnitChanged(newUnit)
            }
        }
    }
    
    private var destinationUnitSection: some View {
        Section("To") {
            Picker("To", selection: $viewModel.destinationUnit) {
                ForEach(viewModel.availableDestinationUnits, id: \.self) { unit in
                    Text(unit)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: viewModel.destinationUnit) { _, newUnit in
                viewModel.onDestinationUnitChanged(newUnit)
            }
        }
    }
    
    private var inputValueSection: some View {
        Section("Entry value") {
            TextField("Enter value to convert", text: $viewModel.inputValue)
                .keyboardType(.decimalPad)
                .onChange(of: viewModel.inputValue) { _, newValue in
                    viewModel.onInputValueChanged(newValue)
                }
        }
    }
    
    private var resultSection: some View {
        Section("Result") {
            Text(viewModel.result)
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

// MARK: - Preview

#Preview {
    let repository = ConversionRepositoryImpl()
    let convertUseCase = ConvertValueUseCaseImpl(repository: repository)
    let getUnitsUseCase = GetAvailableUnitsUseCaseImpl(repository: repository)
    let viewModel = ConversionViewModel(
        convertValueUseCase: convertUseCase,
        getAvailableUnitsUseCase: getUnitsUseCase
    )
    
    return ConversionView(viewModel: viewModel)
}
