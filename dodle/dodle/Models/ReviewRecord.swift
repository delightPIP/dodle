//
//  ChallengeRecord.swift
//  dodle
//
//  Created by taeni on 4/21/25.
//
import Foundation
import SwiftData

@Model
class ReviewRecord: Identifiable {
    var id: UUID
    
    var challengeReview: String
    // subTopping Enum 추가 후 작업 예정
//    var subTopping: String
    
    var challengedAt: Date
    var createdAt: Date
    
    var challengeRecipe: ChallengeRecipe? // 1:N
    
    init(id: UUID, challengeReview: String, challengedAt: Date, createdAt: Date) {
        self.id = id
        self.challengeReview = challengeReview
        self.challengedAt = challengedAt
        self.createdAt = createdAt
    }
}
