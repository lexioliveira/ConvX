//
//  ConversionViewModel.swift
//  ConvX
//
//  Created by Lexi Oliveira on 27/09/25.
//

import Foundation
import SwiftUI

// MARK: - ViewModel

@MainActor
class ConversionViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var selectedConversionType: ConversionType = .temperature
    @Published var sourceUnit: String = TemperatureUnit.celsius.rawValue
    @Published var destinationUnit: String = TemperatureUnit.fahrenheit.rawValue
    @Published var inputValue: String = "0"
    @Published var result: String = "0.00"
    @Published var isLoading: Bool = false
    
    // MARK: - Private Properties
    private let convertValueUseCase: ConvertValueUseCase
    private let getAvailableUnitsUseCase: GetAvailableUnitsUseCase
    
    // MARK: - Initialization
    init(
        convertValueUseCase: ConvertValueUseCase,
        getAvailableUnitsUseCase: GetAvailableUnitsUseCase
    ) {
        self.convertValueUseCase = convertValueUseCase
        self.getAvailableUnitsUseCase = getAvailableUnitsUseCase
        setupInitialState()
    }
    
    // MARK: - Public Methods
    
    func onConversionTypeChanged(_ newType: ConversionType) {
        selectedConversionType = newType
        updateUnitsForNewType()
        performConversion()
    }
    
    func onSourceUnitChanged(_ newUnit: String) {
        sourceUnit = newUnit
        handleSourceUnitConflict()
        performConversion()
    }
    
    func onDestinationUnitChanged(_ newUnit: String) {
        destinationUnit = newUnit
        performConversion()
    }
    
    func onInputValueChanged(_ newValue: String) {
        inputValue = newValue
        performConversion()
    }
    
    // MARK: - Computed Properties
    
    var availableSourceUnits: [String] {
        getAvailableUnitsTitle()
    }
    
    var availableDestinationUnits: [String] {
        getAvailableUnitsTitle().filter { $0 != sourceUnit }
    }
    
    // MARK: - Private Methods
    
    private func setupInitialState() {
        updateUnitsForNewType()
        performConversion()
    }
    
    private func updateUnitsForNewType() {
        let availableUnits = getAvailableUnitsTitle()
        sourceUnit = availableUnits.first ?? ""
        destinationUnit = availableDestinationUnits.first ?? ""
    }
    
    private func handleSourceUnitConflict() {
        if sourceUnit == destinationUnit {
            destinationUnit = availableDestinationUnits.first ?? ""
        }
    }
    
    private func getAvailableUnitsTitle() -> [String] {
        getAvailableUnitsUseCase.execute(for: selectedConversionType).map { $0.title }
    }
    
    private func performConversion() {
        guard let inputDouble = Double(inputValue) else {
            result = "0.00"
            return
        }
        
        let request = ConversionRequest(
            value: inputDouble,
            fromUnit: sourceUnit,
            toUnit: destinationUnit,
            conversionType: selectedConversionType
        )
        
        let conversionResult = convertValueUseCase.execute(request)
        result = conversionResult.formattedValue
    }
}
