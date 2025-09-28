//
//  GetAvailableUnitsUseCase.swift
//  ConvX
//
//  Created by Lexi Oliveira on 27/09/25.
//

import Foundation

protocol GetAvailableUnitsUseCase {
    func execute(for type: ConversionType) -> [any ConversionOption]
}

class GetAvailableUnitsUseCaseImpl: GetAvailableUnitsUseCase {
    private let repository: ConversionRepository
    
    init(repository: ConversionRepository) {
        self.repository = repository
    }
    
    func execute(for type: ConversionType) -> [any ConversionOption] {
        return repository.getAvailableUnits(for: type)
    }
}
