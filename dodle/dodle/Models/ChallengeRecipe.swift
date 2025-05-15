//
//  ChallengeRecipe.swift
//  dodle
//
//  Created by taeni on 4/15/25.
//
import Foundation
import SwiftData

@Model
class ChallengeRecipe: Identifiable, Hashable {
    var id: UUID
    
    var type: RecipeType
    var title: String
    var minimumGoal: String
    var emotion: ChallengeEmotion
    var kick: Kick
    var completedAt: Date
    var startedAt: Date?
    var isAlarmOn: Bool
    var createdAt: Date
    var spiceLevel: SpiceLevel
    var completedReview: String
    
    @Relationship(deleteRule: .cascade, inverse: \ReviewRecord.challengeRecipe)
    var reviewRecords: [ReviewRecord] = []
    
    // 도전완료 여부
    var isComplete: Bool {
        return spiceLevel != .none
    }
    
    // 도전완료가 필요한 값
    var willCompleteSoon: Bool {
        return !isComplete && Date() > completedAt
    }
    
    // 오늘 도전하는 값
    var willTodayComplete: Bool {
        return Calendar.current.isDate(completedAt, inSameDayAs: Date())
    }
    
    
    init(
        id: UUID = UUID(),
        type: RecipeType,
        title: String,
        minimumGoal: String,
        emotion: ChallengeEmotion,
        kick: Kick,
        completedAt: Date,
        startedAt: Date? = nil,
        isAlarmOn: Bool = true,
        createdAt: Date = Date(),
        spiceLevel: SpiceLevel,
        completedReview: String
    ) {
        self.id = id
        self.type = type
        self.title = title
        self.minimumGoal = minimumGoal
        self.emotion = emotion
        self.kick = kick
        self.completedAt = completedAt
        self.startedAt = startedAt
        self.isAlarmOn = isAlarmOn
        self.createdAt = createdAt
        self.spiceLevel = spiceLevel
        self.completedReview = completedReview
    }
}

struct Kick : Identifiable, Codable {
    var id: UUID
    var preparation: PreparationType
    var detailDescription: String
    
    init(id: UUID = UUID(), preparation: PreparationType, description: String) {
        self.id = id
        self.preparation = preparation
        self.detailDescription = description
    }
}

enum DateDisplayStyle {
    case fullDateTime    // yyyy년 MM월 dd일 HH시 mm분
    case shortDateTime    // yy년 MM월 dd일 HH:mm
    case dateOnly        // yyyy년 MM월 dd일
    case relative        // "3분 전", "5일 후"
}

extension ChallengeRecipe {
    func formattedCompletedAt(style: DateDisplayStyle) -> String {
        switch style {
        case .fullDateTime:
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
            return formatter.string(from: completedAt)
            
        case .shortDateTime:
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "yy년 MM월 dd일 HH:mm"
            return formatter.string(from: completedAt)
            
        case .dateOnly:
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "yyyy년 MM월 dd일"
            return formatter.string(from: completedAt)
            
        case .relative:
            let formatter = RelativeDateTimeFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.unitsStyle = .full
            return formatter.localizedString(for: completedAt, relativeTo: Date())
        }
    }
}
