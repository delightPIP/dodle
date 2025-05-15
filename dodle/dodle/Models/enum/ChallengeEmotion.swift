//
//  EmotionalType.swift
//  dodle
//
//  Created by taeni on 4/15/25.
//
import Foundation

enum ChallengeEmotion: String, CaseIterable, Identifiable, Codable {
    case anxious
    case tense
    case intrigued
    case expectant
    case thrilled
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .anxious: return "불안한"
        case .tense: return "긴장되는"
        case .intrigued: return "흥미로운"
        case .expectant: return "기대하는"
        case .thrilled: return "설레는"
        }
    }
    
    var displayImageName: String {
        switch self {
        case .anxious: return "noodle1"
        case .tense: return "noodle2"
        case .intrigued: return "noodle3"
        case .expectant: return "noodle4"
        case .thrilled: return "noodle5"
        }
    }
}
