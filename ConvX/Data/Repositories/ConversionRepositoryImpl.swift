//
//  ConversionRepositoryImpl.swift
//  ConvX
//
//  Created by Lexi Oliveira on 27/09/25.
//

import Foundation

// MARK: - Repository Implementation

class ConversionRepositoryImpl: ConversionRepository {
    
    func convert(_ request: ConversionRequest) -> ConversionResult {
        let convertedValue: Double
        
        switch request.conversionType {
        case .temperature:
            convertedValue = convertTemperature(
                from: request.fromUnit,
                to: request.toUnit,
                value: request.value
            )
        case .length:
            convertedValue = convertLength(
                from: request.fromUnit,
                to: request.toUnit,
                value: request.value
            )
        case .time:
            convertedValue = convertTime(
                from: request.fromUnit,
                to: request.toUnit,
                value: request.value
            )
        case .volume:
            convertedValue = convertVolume(
                from: request.fromUnit,
                to: request.toUnit,
                value: request.value
            )
        }
        
        return ConversionResult(
            value: convertedValue,
            formattedValue: String(format: "%.2f", convertedValue),
            fromUnit: request.fromUnit,
            toUnit: request.toUnit,
            conversionType: request.conversionType
        )
    }
    
    func getAvailableUnits(for type: ConversionType) -> [any ConversionOption] {
        switch type {
        case .temperature:
            return TemperatureUnit.allCases
        case .length:
            return LengthUnit.allCases
        case .time:
            return TimeUnit.allCases
        case .volume:
            return VolumeUnit.allCases
        }
    }
    
    // MARK: - Private Conversion Methods
    
    private func convertTemperature(from source: String, to destination: String, value: Double) -> Double {
        let celsiusValue: Double
        
        // Convert source to Celsius
        switch source {
        case TemperatureUnit.celsius.rawValue:
            celsiusValue = value
        case TemperatureUnit.fahrenheit.rawValue:
            celsiusValue = (value - 32) * 5/9
        case TemperatureUnit.kelvin.rawValue:
            celsiusValue = value - 273.15
        default:
            return 0.0
        }
        
        // Convert Celsius to destination
        switch destination {
        case TemperatureUnit.celsius.rawValue:
            return celsiusValue
        case TemperatureUnit.fahrenheit.rawValue:
            return celsiusValue * 9/5 + 32
        case TemperatureUnit.kelvin.rawValue:
            return celsiusValue + 273.15
        default:
            return 0.0
        }
    }
    
    private func convertLength(from source: String, to destination: String, value: Double) -> Double {
        let meterValue: Double
        
        // Convert source to meters
        switch source {
        case LengthUnit.meters.rawValue:
            meterValue = value
        case LengthUnit.kilometers.rawValue:
            meterValue = value * 1000
        case LengthUnit.feet.rawValue:
            meterValue = value * 0.3048
        case LengthUnit.yards.rawValue:
            meterValue = value * 0.9144
        case LengthUnit.miles.rawValue:
            meterValue = value * 1609.344
        default:
            return 0.0
        }
        
        // Convert meters to destination
        switch destination {
        case LengthUnit.meters.rawValue:
            return meterValue
        case LengthUnit.kilometers.rawValue:
            return meterValue / 1000
        case LengthUnit.feet.rawValue:
            return meterValue / 0.3048
        case LengthUnit.yards.rawValue:
            return meterValue / 0.9144
        case LengthUnit.miles.rawValue:
            return meterValue / 1609.344
        default:
            return 0.0
        }
    }
    
    private func convertTime(from source: String, to destination: String, value: Double) -> Double {
        let secondValue: Double
        
        // Convert source to seconds
        switch source {
        case TimeUnit.seconds.rawValue:
            secondValue = value
        case TimeUnit.minutes.rawValue:
            secondValue = value * 60
        case TimeUnit.hours.rawValue:
            secondValue = value * 3600
        case TimeUnit.days.rawValue:
            secondValue = value * 86400
        default:
            return 0.0
        }
        
        // Convert seconds to destination
        switch destination {
        case TimeUnit.seconds.rawValue:
            return secondValue
        case TimeUnit.minutes.rawValue:
            return secondValue / 60
        case TimeUnit.hours.rawValue:
            return secondValue / 3600
        case TimeUnit.days.rawValue:
            return secondValue / 86400
        default:
            return 0.0
        }
    }
    
    private func convertVolume(from source: String, to destination: String, value: Double) -> Double {
        let literValue: Double
        
        // Convert source to liters
        switch source {
        case VolumeUnit.liters.rawValue:
            literValue = value
        case VolumeUnit.milliliters.rawValue:
            literValue = value / 1000
        case VolumeUnit.cups.rawValue:
            literValue = value * 0.236588
        case VolumeUnit.pints.rawValue:
            literValue = value * 0.473176
        case VolumeUnit.gallons.rawValue:
            literValue = value * 3.78541
        default:
            return 0.0
        }
        
        // Convert liters to destination
        switch destination {
        case VolumeUnit.liters.rawValue:
            return literValue
        case VolumeUnit.milliliters.rawValue:
            return literValue * 1000
        case VolumeUnit.cups.rawValue:
            return literValue / 0.236588
        case VolumeUnit.pints.rawValue:
            return literValue / 0.473176
        case VolumeUnit.gallons.rawValue:
            return literValue / 3.78541
        default:
            return 0.0
        }
    }
}
