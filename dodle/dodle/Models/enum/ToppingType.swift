//
//  PreparationType.swift
//  dodle
//
//  Created by taeni on 4/15/25.
//
import Foundation

enum ToppingType: String, CaseIterable, Identifiable, Codable  {
    case resolution
    case material
    case place
    
    var id: String { self.rawValue }
    
    var displayName: String {
        switch self {
        case .resolution: return "다짐"
        case .material: return "준비물"
        case .place: return "장소"
        }
    }
    
    
    var displayImageName: String {
        switch self {
        case .resolution: return "topping4"
        case .material: return "topping5"
        case .place: return "topping6"
        }
    }
}
