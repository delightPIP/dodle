//
//  PreparationType.swift
//  dodle
//
//  Created by taeni on 4/15/25.
//
import Foundation

enum PreparationType: String, CaseIterable, Identifiable, Codable  {
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
    
    var displayExplainText: String {
        switch self {
        case .resolution: return "예시: 실패를 무서워하지말자!"
        case .material: return "예시: 노트북, 수영복"
        case .place: return "예시: 자격증 시험장소, 스터디카페"
        }
    }
    
    var displayImageName: String {
        switch self {
        case .resolution: return "topping1"
        case .material: return "topping2"
        case .place: return "topping3"
        }
    }
}
