//
//  ConversionType.swift
//  ConvX
//
//  Created by Lexi Oliveira on 27/09/25.
//

import Foundation

// MARK: - Domain Entities

enum ConversionType: String, CaseIterable {
    case temperature = "Temperature"
    case length = "Length"
    case time = "Time"
    case volume = "Volume"
}

protocol ConversionOption: CaseIterable {
    var title: String { get }
}

enum TemperatureUnit: String, ConversionOption {
    case celsius = "°C"
    case fahrenheit = "°F"
    case kelvin = "K"
    
    var title: String {
        return self.rawValue
    }
}

enum LengthUnit: String, ConversionOption {
    case meters = "m"
    case kilometers = "km"
    case feet = "ft"
    case yards = "yd"
    case miles = "mi"
    
    var title: String {
        return self.rawValue
    }
}

enum TimeUnit: String, ConversionOption {
    case seconds = "s"
    case minutes = "min"
    case hours = "h"
    case days = "d"
    
    var title: String {
        return self.rawValue
    }
}

enum VolumeUnit: String, ConversionOption {
    case milliliters = "mL"
    case liters = "L"
    case cups = "cup"
    case pints = "pt"
    case gallons = "gal"
    
    var title: String {
        return self.rawValue
    }
}

// MARK: - Conversion Request/Response Models

struct ConversionRequest {
    let value: Double
    let fromUnit: String
    let toUnit: String
    let conversionType: ConversionType
}

struct ConversionResult {
    let value: Double
    let formattedValue: String
    let fromUnit: String
    let toUnit: String
    let conversionType: ConversionType
}
