//
//  ConvertValueUseCase.swift
//  ConvX
//
//  Created by Lexi Oliveira on 27/09/25.
//

import Foundation

// MARK: - Use Cases

protocol ConvertValueUseCase {
    func execute(_ request: ConversionRequest) -> ConversionResult
}

class ConvertValueUseCaseImpl: ConvertValueUseCase {
    private let repository: ConversionRepository
    
    init(repository: ConversionRepository) {
        self.repository = repository
    }
    
    func execute(_ request: ConversionRequest) -> ConversionResult {
        return repository.convert(request)
    }
}
