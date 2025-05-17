//
//  ChallengeRecipe+Sample.swift
//  dodle
//
//  Created by taeni on 4/15/25.
//
import Foundation

extension ChallengeRecipe {
    static let sampleData: [ChallengeRecipe] = [
        ChallengeRecipe(
            type: .cup,
            title: "레시피 생성",
            minimumGoal: "도전 레시피를 만들어보자!",
            positiveEmotion: 0.5,
            negativeEmotion: 0.2,
            completedEmotion: .none,
            kick: Kick(preparation: .resolution, description: "시도만으로도 완벽하다."),
            completedAt: Date.now + 1.0,
            spiceLevel: .none,
            completedReview: ""
        ),
        ChallengeRecipe(
            type: .pan,
            title: "레시피 조회",
            minimumGoal: "도전 후 레시피의 맵기를 추가해보자!",
            positiveEmotion: 0.5,
            negativeEmotion: 0.2,
            completedEmotion: .none,
            kick: Kick(preparation: .material, description: "조건"),
            completedAt: Date.now,
            spiceLevel: .none,
            completedReview: ""
        ),
        ChallengeRecipe(
            type: .pot,
            title: "레시피 수정",
            minimumGoal: "나의 킥을 수정하자!",
            positiveEmotion: 0.5,
            negativeEmotion: 0.8,
            completedEmotion: .none,
            kick: Kick(preparation: .material, description: "아이폰"),
            completedAt: Date.now + 3.0,
            spiceLevel: .none,
            completedReview: ""
        ),
        ChallengeRecipe(
            type: .cup,
            title: "레시피 살펴보기",
            minimumGoal: "완성된 레시피를 살펴보자!",
            positiveEmotion: 0.3,
            negativeEmotion: 0.4,
            completedEmotion: .none,
            kick: Kick(preparation: .material, description: "조건임"),
            completedAt: Date.now + 3.0,
            spiceLevel: .verySpicy,
            completedReview: ""
        ),
        ChallengeRecipe(
            type: .pan,
            title: "레시피 삭제",
            minimumGoal: "레시피를 삭제해보자.",
            positiveEmotion: 0.2,
            negativeEmotion: 0.7,
            completedEmotion: .intrigued,
            kick: Kick(preparation: .place, description: "삭제하고 싶은 곳에서"),
            completedAt: Date.now - 3.0,
            spiceLevel: .medium,
            completedReview: "삭제했당ㅠ"
        ),
        ChallengeRecipe(
            type: .pot,
            title: "레시피로 요리",
            minimumGoal: "이 레시피는 또 도전해볼거야!",
            positiveEmotion: 0.9,
            negativeEmotion: 0.1,
            completedEmotion: .thrilled,
            kick: Kick(preparation: .place, description: "추후 추가될 기능!"),
            completedAt: Date.now - 5.0,
            spiceLevel: .mild,
            completedReview: "재미있었당"
        ),
        ChallengeRecipe(
            type: .pot,
            title: "정보처리기사 자격증 합격",
            minimumGoal: "합격하기",
            positiveEmotion: 1.0,
            negativeEmotion: 1.0,
            completedEmotion: .intrigued,
            kick: Kick(preparation: .place, description: "포항 자격증 시험장"),
            completedAt: Date.now - 8,
            spiceLevel: .verySpicy,
            completedReview: "합격했따"
        ),
        ChallengeRecipe(
            type: .cup,
            title: "다도 체험하기",
            minimumGoal: "차의 종류 알기",
            positiveEmotion: 0.3,
            negativeEmotion: 0.5,
            completedEmotion: .expectant,
            kick: Kick(preparation: .resolution, description: "말차 격불 성공해야지"),
            completedAt: Date.now - 8,
            spiceLevel: .veryMild,
            completedReview: "차는 맛있었당"
        ),
        ChallengeRecipe(
            type: .pan,
            title: "꾸준히 책 읽기",
            minimumGoal: "하루에 10분씩",
            positiveEmotion: 0.5,
            negativeEmotion: 0.0,
            completedEmotion: .expectant,
            kick: Kick(preparation: .material, description: "채식주의자 책"),
            completedAt: Date.now - 8,
            spiceLevel: .mild,
            completedReview: "굿 굿 굿 매우 만족"
        )
    ]
}

