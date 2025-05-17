//
//  Step.swift
//  dodle
//
//  Created by taeni on 4/16/25.
//
import Foundation

enum StepState: Int, CaseIterable {
    case title, minimumGoal, emotion, kick, completedAt

    var description: String {
        switch self {
        case .title: return "도전명"
        case .minimumGoal: return "최소 목표"
        case .emotion: return "감정"
        case .kick: return "비법"
        case .completedAt: return "날짜설정"
        }
    }
    
    var explain: String {
        switch self {
        case .title: return "도전명을\n작성해주세요."
        case .minimumGoal: return "꼭 채워야 할 최소 목표를\n작성해주세요."
        case .emotion: return "도전을 만들고 있는 지금\n어떤 감정이 드나요?"
        case .kick: return "이 도전의 메인 요소는 뭔가요?\n메인 토핑을 선택 후 작성해주세요."
        case .completedAt: return "도전 레시피가 완성되어가고 있어요!\n시간이 얼마나 필요할까요?"
        }
    }
}

extension StepState {
    var number: Int { rawValue + 1 }
    
    var isLast: Bool { self == StepState.allCases.last }
    
    func next() -> StepState? {
        StepState(rawValue: self.rawValue + 1)
    }
    
    func previous() -> StepState? {
        StepState(rawValue: self.rawValue - 1)
    }
}
