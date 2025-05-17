//
//  RecipeCombineImage.swift
//  dodle
//
//  Created by taeni on 5/17/25.
//

import SwiftUI

enum SizeType: Int {
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case XxLarge
    
    var maxWidthSize : CGFloat {
        switch self {
        case .xSmall: return 60
        case .small: return 120
        case .medium: return 180
        case .large: return 240
        case .xLarge: return 300
        case .XxLarge: return 360
        }
    }
    
    var width : CGFloat {
        switch self {
        case .xSmall: return 60
        case .small: return 120
        case .medium: return 180
        case .large: return 240
        case .xLarge: return 300
        case .XxLarge: return 360
        }
    }
    
    var height : CGFloat {
        switch self {
        case .xSmall: return 50
        case .small: return 100
        case .medium: return 150
        case .large: return 200
        case .xLarge: return 250
        case .XxLarge: return 300
        }
    }
}

struct RecipeCombineImage: View {
    var cookerImage: String
    var noodleImage: String
    var toppings: [String]
    var sizeType: SizeType = .small
    var spiceLevel: SpiceLevel
    var isCompleted: Bool
    
    var willCompleteSoon: Bool = false
    var willTodayComplete: Bool = false
    
    init(cupImage: String, noodleImage: String, toppings: [String], spiceLevel: SpiceLevel, sizeType: SizeType, isCompleted: Bool) {
        self.cookerImage = cupImage
        self.noodleImage = noodleImage
        self.toppings = toppings
        self.spiceLevel = spiceLevel
        self.sizeType = sizeType
        self.isCompleted = isCompleted
    }
    
    init(recipe: ChallengeRecipe, sizeType: SizeType){
        self.cookerImage = recipe.type.displayImageName
        self.noodleImage = recipe.emotion.displayImageName
        self.toppings = [recipe.kick.preparation.displayImageName]
        self.spiceLevel = recipe.spiceLevel
        self.sizeType = sizeType
        
        self.isCompleted = recipe.isComplete
        self.willCompleteSoon = recipe.willCompleteSoon
        self.willTodayComplete = recipe.willTodayComplete
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            recipeImage(cookerImage)
            
            if isCompleted {
                
                
//                recipeImage(noodleImage)
                ZStack {
                    WaterShape()
                        .fill(spiceLevel.color)
                        .opacity(0.8)
                        .frame(width: sizeType.width, height:sizeType.height)
                        .background(.clear)
                    
                    WavyNoodleShape(progress: 0.5, waveCount: 16)
                        .stroke(Color.noodle, lineWidth: 1 + 3 * 0.5,)
                        .frame(width: 300, height: 100)
                        .animation(.easeInOut(duration: 0.3), value: 0.5)
                        .animation(.easeInOut(duration: 0.3), value: 0.5)
                        .mask{
                            WaterShape()
                                .foregroundColor(Color.water)
                                .frame(width:300, height: 250)
                        }
                }
                
                
                recipeImage("topping_base1")
                
                ForEach(toppings, id: \.self) { topping in
                    recipeImage(topping)
                }
            } else {
                recipeImage("\(cookerImage)_lid")
                
                if willTodayComplete || willCompleteSoon {
                    recipeImage("\(cookerImage == "cup" ? "chopstick":"fire")")
                }
                
            }
        }
    }
    
    private func recipeImage(_ name: String) -> some View {
        RecipeImage(name: name)
            .frame(maxWidth: sizeType.maxWidthSize)
    }
}

struct RecipeImage: View {
    let name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}


#Preview {
    RecipeCombineImage(recipe: ChallengeRecipe.sampleData[1], sizeType: .medium)
    
    RecipeCombineImage(cupImage: RecipeType.cup.displayImageName, noodleImage: ChallengeEmotion.intrigued.displayImageName, toppings: [PreparationType.resolution.displayImageName, "topping3"], spiceLevel: .medium, sizeType: .xLarge, isCompleted: true)
    
    RecipeCombineImage(recipe: ChallengeRecipe.sampleData[2], sizeType: .medium)
}


