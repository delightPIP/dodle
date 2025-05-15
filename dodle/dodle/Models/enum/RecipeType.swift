//
//  RecipeType.swift
//  dodle
//
//  Created by taeni on 4/15/25.
//
import Foundation

enum RecipeType: String, CaseIterable, Identifiable, Codable  {
    case pot
    case cup
    case pan
    
    var id: String { self.rawValue }
    
    var challengeName: String {
        switch self {
        case .pot: return "기간이 정해진 도전이에요."
        case .cup: return "새로운 경험을 해볼래요."
        case .pan: return "습관을 형성하고 싶어요"
        }
    }
    
    var challengeTypeName: String {
        switch self {
        case .pot: return "목표일이 정해진 도전" //기간한정 도전
        case .cup: return "체험하기 위한 도전" // 새로운 경험 도전
        case .pan: return "루틴을 만드는 도전" // 습관형성 도전
        }
    }
    
    var cooker: String {
        switch self {
        case .pot: return "냄비"
        case .cup: return "컵라면"
        case .pan: return "팬"
        }
    }
    
    var displayName: String {
        switch self {
        case .pot: return "냄비라면"
        case .cup: return "컵라면"
        case .pan: return "볶음라면"
        }
    }
    
    var displayImageName: String {
        switch self {
        case .pot: return "pot"
        case .cup: return "cup"
        case .pan: return "pan"
        }
    }
}
