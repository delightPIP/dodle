//
//  NavigationManager.swift
//  dodle
//
//  Created by taeni on 5/15/25.
//
import SwiftUI
import SwiftData

enum ViewType: Hashable {
    case list
    case details(recipe: ChallengeRecipe, selectedTab: DetailsTab)
    case write(recipeType: RecipeType)
    case edit(recipe: ChallengeRecipe)
    case record(recipe: ChallengeRecipe, record: ReviewRecord)
    
    // 도전완료 상태 관련
    case changeRecipeStatus(recipe: ChallengeRecipe)
    
    // deep link
    case nestedDestination(path: [ViewType])
}

enum DetailsTab: String, CaseIterable {
    case ingredient = "재료"
    case instruction = "요리방법"
    case record = "기록"
}

// MARK: - 화면 전환을 관리하는 객체
class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    // MARK: - 기본 네비게이션 메서드
    
    /// 단일 화면으로 이동
    func navigate(to destination: ViewType) {
        path.append(destination)
    }
    
    /// 여러 화면을 순차적으로 추가
    func navigateSequentially(to destinations: [ViewType]) {
        destinations.forEach { path.append($0) }
    }
    
    /// 루트로 이동
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    /// 뒤로 가기
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    /// 특정 횟수만큼 뒤로 가기
    func pop(count: Int) {
        let safeCount = min(count, path.count)
        if safeCount > 0 {
            path.removeLast(safeCount)
        }
    }
    
    // MARK: - 화면 전환 메소드
    func showRecipeDetail(recipe: ChallengeRecipe, selectedTab: DetailsTab) {
        navigate(to: .details(recipe: recipe, selectedTab: selectedTab))
    }
    
    func showWriteRecipe(selectedRecipeType: RecipeType) {
        navigate(to: .write(recipeType: selectedRecipeType))
    }
    
    func showEditRecipe(recipe: ChallengeRecipe) {
        navigate(to: .edit(recipe: recipe))
    }
    
    func showRecordWrite(recipe: ChallengeRecipe, record: ReviewRecord) {
        navigate(to: .record(recipe: recipe, record: record))
    }
    
    func showChangeRecipeStatus(recipe: ChallengeRecipe) {
        navigate(to: .changeRecipeStatus(recipe: recipe))
    }
    
    // MARK: - 푸시 알림 처리 메서드
    func handlePushNotification(payload: [String: Any]) {
        guard let notificationType = payload["type"] as? String else { return }
        
        switch notificationType {
//        case "new_post":
//            // 새 게시글 알림이면 리스트에서 해당 게시글 상세로 이동
//            if let postIdString = payload["postId"] as? String,
//               let postId = UUID(uuidString: postIdString) {
//                navigateSequentially(to: [.list, .detail(id: postId)])
//            }
//            
//        case "new_comment":
//            // 새 댓글 알림이면 해당 게시글의 댓글 화면으로 이동
//            if let postIdString = payload["postId"] as? String,
//               let postId = UUID(uuidString: postIdString) {
//                navigateSequentially(to: [.list, .detail(id: postId), .comment(postId: postId)])
//            }
//            
//        case "status_change":
//            // 상태 변경 알림이면 상태 변경 화면으로 이동
//            if let postIdString = payload["postId"] as? String,
//               let postId = UUID(uuidString: postIdString) {
//                navigateSequentially(to: [.list, .detail(id: postId), .changePostStatus(id: postId)])
//            }
            
        default:
            popToRoot()
        }
    }
    
    func handleDeepLink(url: URL, context: ModelContext) {
        let components = url.pathComponents  // 예: ["/", "recipe", "UUID", "record", "UUID"]

        guard components.count >= 4 else { return } // 정규표현식

        // recipe
//        if components[1] == "recipe", let uuid = UUID(uuidString: components[2]) {
//            // UUID로 ChallengeRecipe 조회
//            let descriptor = FetchDescriptor<ChallengeRecipe>(
//                predicate: #Predicate { $0.id == uuid },
//                fetchLimit: 1
//            )
//
//            guard let recipe = try? context.fetch(descriptor).first else {
//                print("❌ 레시피를 찾을 수 없습니다.")
//                return
//            }
//
//            // 기본 목적지: 레시피 상세 ingredient 탭
//            var destinations: [ViewType] = [.list, .details(recipe: recipe, selectedTab: .ingredient)]
//
//            // 추가 경로에 따라 세부 화면 결정
//            if components.count > 3 {
//                switch components[3] {
//                case "comment":
//                    // comment → 기록(리뷰) 작성 화면
//                    // ReviewRecord 생성이 필요하다면 실제 구현 필요
//                    let dummyRecord = ReviewRecord() // 임시 record
//                    destinations.append(.record(recipe: recipe, record: dummyRecord))
//
//                case "edit":
//                    destinations.append(.edit(recipe: recipe))
//
//                case "status":
//                    destinations.append(.changeRecipeStatus(recipe: recipe))
//
//                default:
//                    break
//                }
//            }
//
//            navigateSequentially(to: destinations)
//        }
    }

}

