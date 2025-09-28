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
            ScrollView {
                VStack(spacing: 24) {
                    headerSection
                    conversionTypeSection
                    conversionFlowSection
                    resultSection
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(.systemBackground),
                        Color(.systemGray6).opacity(0.3)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .navigationTitle("ConvX")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    // MARK: - View Components
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Image(systemName: conversionTypeIcon)
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(conversionTypeColor)
                .frame(width: 40, height: 40)
                .padding(.bottom, 8)
            
            Text("Unit Converter")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
        }
    }
    
    private var conversionTypeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Conversion Type")
                .font(.headline)
                .fontWeight(.semibold)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 12) {
                ForEach(ConversionType.allCases, id: \.self) { type in
                    ConversionTypeCard(
                        type: type,
                        isSelected: viewModel.selectedConversionType == type,
                        action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                viewModel.onConversionTypeChanged(type)
                            }
                        }
                    )
                }
            }
        }
    }
    
    private var conversionFlowSection: some View {
        VStack(spacing: 20) {
            // Input Section
            VStack(alignment: .leading, spacing: 12) {
                Text("From")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                UnitPicker(
                    units: viewModel.availableSourceUnits,
                    selectedUnit: $viewModel.sourceUnit,
                    onSelectionChanged: { newUnit in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            viewModel.onSourceUnitChanged(newUnit)
                        }
                    }
                )
            }
            
            // Input field
            VStack(alignment: .leading, spacing: 8) {
                Text("Value to Convert")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                
                HStack {
                    TextField("Enter value", text: $viewModel.inputValue)
                        .keyboardType(.decimalPad)
                        .font(.title2)
                        .fontWeight(.medium)
                        .textFieldStyle(PlainTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .onChange(of: viewModel.inputValue) { _, newValue in
                            viewModel.onInputValueChanged(newValue)
                        }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(conversionTypeColor.opacity(0.3), lineWidth: 1)
                        )
                )
            }
            
            // Output Section
            VStack(alignment: .leading, spacing: 12) {
                Text("To")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                UnitPicker(
                    units: viewModel.availableDestinationUnits,
                    selectedUnit: $viewModel.destinationUnit,
                    onSelectionChanged: { newUnit in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            viewModel.onDestinationUnitChanged(newUnit)
                        }
                    }
                )
            }
        }
    }
    
    private var resultSection: some View {
        VStack(spacing: 12) {
            Text("Result")
                .font(.headline)
                .fontWeight(.semibold)
            
            HStack {
                Spacer()
                Text(viewModel.result)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(conversionTypeColor)
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(conversionTypeColor.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(conversionTypeColor.opacity(0.3), lineWidth: 2)
                    )
            )
        }
    }
    
    // MARK: - Computed Properties
    
    private var conversionTypeIcon: String {
        switch viewModel.selectedConversionType {
        case .temperature:
            return "thermometer"
        case .length:
            return "ruler"
        case .time:
            return "clock"
        case .volume:
            return "drop"
        }
    }
    
    private var conversionTypeColor: Color {
        switch viewModel.selectedConversionType {
        case .temperature:
            return .orange
        case .length:
            return .blue
        case .time:
            return .green
        case .volume:
            return .purple
        }
    }
}

// MARK: - Supporting Views

struct ConversionTypeCard: View {
    let type: ConversionType
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: typeIcon)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(isSelected ? .white : typeColor)
                    .frame(width: 24, height: 24)
                
                Text(type.rawValue)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .white : .primary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? typeColor : Color(.systemGray6))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(typeColor.opacity(isSelected ? 0 : 0.3), lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
    
    private var typeIcon: String {
        switch type {
        case .temperature:
            return "thermometer"
        case .length:
            return "ruler"
        case .time:
            return "clock"
        case .volume:
            return "drop"
        }
    }
    
    private var typeColor: Color {
        switch type {
        case .temperature:
            return .orange
        case .length:
            return .blue
        case .time:
            return .green
        case .volume:
            return .purple
        }
    }
}

struct UnitPicker: View {
    let units: [String]
    @Binding var selectedUnit: String
    let onSelectionChanged: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(units, id: \.self) { unit in
                    Button(action: {
                        selectedUnit = unit
                        onSelectionChanged(unit)
                    }) {
                        Text(unit)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedUnit == unit ? .white : .primary)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(selectedUnit == unit ? Color.accentColor : Color(.systemGray5))
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, 4)
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
