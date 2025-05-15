//
//  SpiceLevel.swift
//  dodle
//
//  Created by taeni on 4/15/25.
//
import Foundation
import SwiftUI

enum SpiceLevel: String, CaseIterable, Identifiable, Codable {
    case none
    case veryMild
    case mild
    case medium
    case spicy
    case verySpicy
    
    var id: String { self.rawValue }
    
    var icon: String {
        switch self {
        case .none: return "💭"
        case .veryMild: return "🌶️"
        case .mild: return "🌶️🌶️"
        case .medium: return "🌶️🌶️🌶️"
        case .spicy: return "🌶️🌶️🌶️🌶️"
        case .verySpicy: return "🌶️🌶️🌶️🌶️🌶️"
        }
    }
    
    var displayName: String {
        switch self {
        case .none: return "맛보기 전"
        case .veryMild: return "아주 순한맛"
        case .mild: return "순한맛"
        case .medium: return "보통맛"
        case .spicy: return "매운맛"
        case .verySpicy: return "아주 매운맛"
        }
    }
    
    var displayExplain: String {
        switch self {
        case .none: return ""
        case .veryMild: return "가볍게 해냈기에, 더더욱 만족한"
        case .mild: return "부담감 없이, 기분이 좋았던"
        case .medium: return "적당히 어렵고, 적당히 긴장한"
        case .spicy: return "쉽지 않았지만, 그래서 더 뿌듯한"
        case .verySpicy: return "너무 힘들었지만, 그래서 강렬한"
        }
    }
}

extension SpiceLevel {
    var color: Color {
        switch self {
        case .none: return .clear
        case .veryMild: return .spiceVeryMild
        case .mild: return .spiceMild
        case .medium: return .spiceMedium
        case .spicy: return .spiceSpicy
        case .verySpicy: return .spiceVerySpicy
        }
    }
    
    
    static func from(number: Int) -> SpiceLevel? {
        let levels = Array(SpiceLevel.allCases.dropFirst()) // none 제외
        guard (1...5).contains(number) else { return nil }
        return levels[number - 1]
    }
}
