//
//  ConversionRepository.swift
//  ConvX
//
//  Created by Lexi Oliveira on 27/09/25.
//

import Foundation

// MARK: - Repository Protocol

protocol ConversionRepository {
    func convert(_ request: ConversionRequest) -> ConversionResult
    func getAvailableUnits(for type: ConversionType) -> [any ConversionOption]
}
