//
//  ContentView.swift
//  ConvX
//
//  Created by Lexi Oliveira on 27/09/25.
//

import SwiftUI

protocol ConvertionOption: CaseIterable {
    
//    static var allCases: [String] { get }
    var title: String { get }
}

enum ConversionType: String, CaseIterable {
    
    case temperature = "Temperature"
    case lenght = "Lenght"
    case time = "Time"
    case volume = "Volume"
    
    var options: [any ConvertionOption] {
        switch self {
        case .temperature:
            return TemperatureOptions.allCases
        case .lenght:
            return LenthOptions.allCases
        case .time:
            return TimeOptions.allCases
        case .volume:
            return VolumeOptions.allCases
        }
    }
}

enum TemperatureOptions: String, ConvertionOption {
    
    case celsius = "°C"
    case fahrenheit = "°F"
    case kelvin = "K"
    
    var title: String {
        self.rawValue
    }
}

enum LenthOptions: String, ConvertionOption {
    
    case meters = "m"
    case kilometers = "km"
    case feet = "ft"
    case yards = "yd"
    case miles = "mi"
    
    var title: String {
        self.rawValue
    }
}

enum TimeOptions: String, ConvertionOption {
    
    case seconds = "s"
    case minutes = "min"
    case hours = "h"
    case days = "d"
    
    var title: String {
        self.rawValue
    }
}

enum VolumeOptions: String, ConvertionOption {
    
    case milliliters = "mL"
    case liters = "L"
    case cups = "cup"
    case pints = "pt"
    case gal = "gal"
    
    var title: String {
        self.rawValue
    }
}

struct ContentView: View {
    
    @State var selectConvertType: ConversionType = .temperature
    @State var sourceOptionType: String = TemperatureOptions.celsius.rawValue
    @State var destinationOptionType: String = TemperatureOptions.fahrenheit.rawValue
    @State var entryValue: String = "0"
    @State var result: Double = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Select the conversion type:") {
                    Picker("Conversion type", selection: $selectConvertType) {
                        ForEach(ConversionType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .onChange(of: selectConvertType) { oldType, newType in
                        handleConversionTypeChange(newType)
                        calculateConversion()
                    }
                }
                
                Section("From") {
                    Picker("From", selection: $sourceOptionType) {
                        ForEach(getSourceOptionsTitle(), id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: sourceOptionType) { oldType, newType in
                        handleSourceOptionChange(newType)
                        calculateConversion()
                    }
                }
                
                Section("To") {
                    Picker("To", selection: $destinationOptionType) {
                        ForEach(getDestinationOptionsTitle(), id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: destinationOptionType) { oldType, newType in
                        calculateConversion()
                    }
                }
                
                Section("Entry value") {
                    TextField("Enter value to convert", text: $entryValue)
                        .keyboardType(.decimalPad)
                        .onChange(of: entryValue) { oldValue, newValue in
                            calculateConversion()
                        }
                }
                
                Section("Result") {
                    Text(String(format: "%.2f", result))
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
            .navigationTitle("ConvX")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func getSourceOptionsTitle() -> [String] {
        selectConvertType.options.map { $0.title }
    }
    
    private func getDestinationOptionsTitle() -> [String] {
        getSourceOptionsTitle().filter { $0 != sourceOptionType }
    }
    
    private func handleConversionTypeChange(_ newType: ConversionType) {
        sourceOptionType = getSourceOptionsTitle().first ?? ""
        destinationOptionType = getDestinationOptionsTitle().first ?? ""
    }
    
    private func handleSourceOptionChange(_ newOption: String) {
        if newOption == destinationOptionType {
            destinationOptionType = getDestinationOptionsTitle().first ?? ""
        }
    }
    
    // MARK: - Conversion Functions
    
    private func calculateConversion() {
        guard let inputValue = Double(entryValue) else {
            result = 0.0
            return
        }
        
        switch selectConvertType {
        case .temperature:
            result = convertTemperature(from: sourceOptionType, to: destinationOptionType, value: inputValue)
        case .lenght:
            result = convertLength(from: sourceOptionType, to: destinationOptionType, value: inputValue)
        case .time:
            result = convertTime(from: sourceOptionType, to: destinationOptionType, value: inputValue)
        case .volume:
            result = convertVolume(from: sourceOptionType, to: destinationOptionType, value: inputValue)
        }
    }
    
    // MARK: - Temperature Conversions
    private func convertTemperature(from source: String, to destination: String, value: Double) -> Double {
        let celsiusValue: Double
        
        // Convert source to Celsius
        switch source {
        case TemperatureOptions.celsius.rawValue:
            celsiusValue = value
        case TemperatureOptions.fahrenheit.rawValue:
            celsiusValue = (value - 32) * 5/9
        case TemperatureOptions.kelvin.rawValue:
            celsiusValue = value - 273.15
        default:
            return 0.0
        }
        
        // Convert Celsius to destination
        switch destination {
        case TemperatureOptions.celsius.rawValue:
            return celsiusValue
        case TemperatureOptions.fahrenheit.rawValue:
            return celsiusValue * 9/5 + 32
        case TemperatureOptions.kelvin.rawValue:
            return celsiusValue + 273.15
        default:
            return 0.0
        }
    }
    
    // MARK: - Length Conversions
    private func convertLength(from source: String, to destination: String, value: Double) -> Double {
        let meterValue: Double
        
        // Convert source to meters
        switch source {
        case LenthOptions.meters.rawValue:
            meterValue = value
        case LenthOptions.kilometers.rawValue:
            meterValue = value * 1000
        case LenthOptions.feet.rawValue:
            meterValue = value * 0.3048
        case LenthOptions.yards.rawValue:
            meterValue = value * 0.9144
        case LenthOptions.miles.rawValue:
            meterValue = value * 1609.344
        default:
            return 0.0
        }
        
        // Convert meters to destination
        switch destination {
        case LenthOptions.meters.rawValue:
            return meterValue
        case LenthOptions.kilometers.rawValue:
            return meterValue / 1000
        case LenthOptions.feet.rawValue:
            return meterValue / 0.3048
        case LenthOptions.yards.rawValue:
            return meterValue / 0.9144
        case LenthOptions.miles.rawValue:
            return meterValue / 1609.344
        default:
            return 0.0
        }
    }
    
    // MARK: - Time Conversions
    private func convertTime(from source: String, to destination: String, value: Double) -> Double {
        let secondValue: Double
        
        // Convert source to seconds
        switch source {
        case TimeOptions.seconds.rawValue:
            secondValue = value
        case TimeOptions.minutes.rawValue:
            secondValue = value * 60
        case TimeOptions.hours.rawValue:
            secondValue = value * 3600
        case TimeOptions.days.rawValue:
            secondValue = value * 86400
        default:
            return 0.0
        }
        
        // Convert seconds to destination
        switch destination {
        case TimeOptions.seconds.rawValue:
            return secondValue
        case TimeOptions.minutes.rawValue:
            return secondValue / 60
        case TimeOptions.hours.rawValue:
            return secondValue / 3600
        case TimeOptions.days.rawValue:
            return secondValue / 86400
        default:
            return 0.0
        }
    }
    
    // MARK: - Volume Conversions
    private func convertVolume(from source: String, to destination: String, value: Double) -> Double {
        let literValue: Double
        
        // Convert source to liters
        switch source {
        case VolumeOptions.liters.rawValue:
            literValue = value
        case VolumeOptions.milliliters.rawValue:
            literValue = value / 1000
        case VolumeOptions.cups.rawValue:
            literValue = value * 0.236588
        case VolumeOptions.pints.rawValue:
            literValue = value * 0.473176
        case VolumeOptions.gal.rawValue:
            literValue = value * 3.78541
        default:
            return 0.0
        }
        
        // Convert liters to destination
        switch destination {
        case VolumeOptions.liters.rawValue:
            return literValue
        case VolumeOptions.milliliters.rawValue:
            return literValue * 1000
        case VolumeOptions.cups.rawValue:
            return literValue / 0.236588
        case VolumeOptions.pints.rawValue:
            return literValue / 0.473176
        case VolumeOptions.gal.rawValue:
            return literValue / 3.78541
        default:
            return 0.0
        }
    }
}

#Preview {
    ContentView()
}
