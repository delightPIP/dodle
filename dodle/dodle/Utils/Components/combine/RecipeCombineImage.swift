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
    case xxLarge
    
    var maxWidthSize : CGFloat {
        switch self {
        case .xSmall: return 60
        case .small: return 120
        case .medium: return 180
        case .large: return 240
        case .xLarge: return 300
        case .xxLarge: return 360
        }
    }
    
    var width : CGFloat {
        switch self {
        case .xSmall: return 60
        case .small: return 120
        case .medium: return 180
        case .large: return 240
        case .xLarge: return 300
        case .xxLarge: return 360
        }
    }
    
    var height : CGFloat {
        switch self {
        case .xSmall: return 50
        case .small: return 100
        case .medium: return 150
        case .large: return 200
        case .xLarge: return 250
        case .xxLarge: return 300
        }
    }
    
    var waveHeight : CGFloat {
        switch self {
        case .xSmall: return 20
        case .small: return 40
        case .medium: return 60
        case .large: return 80
        case .xLarge: return 100
        case .xxLarge: return 120
        }
    }
    
    var waveCount : CGFloat {
        switch self {
        case .xSmall: return 10
        case .small: return 16
        case .medium: return 17
        case .large: return 18
        case .xLarge: return 18
        case .xxLarge: return 20
        }
    }
    
    var waveLineWidth : CGFloat {
        switch self {
        case .xSmall: return 1
        case .small: return 1
        case .medium: return 1
        case .large: return 2
        case .xLarge: return 2
        case .xxLarge: return 2
        }
    }
}

struct RecipeCombineImage: View {
    var cookerImage: String
    var noodleImage: String = ""
    var noodleSetting: EmotionPair
    var toppings: [String]
    var sizeType: SizeType = .small
    var spiceLevel: SpiceLevel
    var isCompleted: Bool
    
    var willCompleteSoon: Bool = false
    var willTodayComplete: Bool = false
    
    init(cupImage: String, emotionPair: EmotionPair, noodleImage: ChallengeEmotion? = ChallengeEmotion.none, toppings: [String], spiceLevel: SpiceLevel, sizeType: SizeType, isCompleted: Bool) {
        self.cookerImage = cupImage
        self.noodleSetting = emotionPair
        self.toppings = toppings
        self.spiceLevel = spiceLevel
        self.sizeType = sizeType
        self.isCompleted = isCompleted
    }
    
    init(recipe: ChallengeRecipe, sizeType: SizeType){
        self.cookerImage = recipe.type.displayImageName
        self.noodleSetting = recipe.emotionPair
        self.noodleImage = recipe.completedEmotion.displayImageName
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
                ZStack {
                    WaterShape()
                        .fill(spiceLevel.color)
                        .opacity(0.8)
                        .frame(width: sizeType.width, height:sizeType.height)
                        .background(.clear)
                    
                    WavyNoodleShape(progress: CGFloat(noodleSetting.negative), waveCount: Int(sizeType.waveCount))
                        .stroke(Color.noodle.opacity(0.7), lineWidth: 1 + sizeType.waveLineWidth * CGFloat(noodleSetting.positive),)
                        .frame(width: sizeType.width, height:sizeType.waveHeight)
                        .animation(.easeInOut(duration: 0.3), value: noodleSetting.negative)
                        .animation(.easeInOut(duration: 0.3), value: noodleSetting.positive)
                        .mask{
                            WaterShape()
                                .foregroundColor(Color.water)
                                .frame(width: sizeType.width, height:sizeType.height)
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
    RecipeCombineImage(recipe: ChallengeRecipe.sampleData[3], sizeType: .xSmall)
    
    RecipeCombineImage(cupImage: RecipeType.cup.displayImageName, emotionPair: EmotionPair(positive: 0.9, negative: 0.8), toppings: [PreparationType.resolution.displayImageName, "topping3"], spiceLevel: .medium, sizeType: .xxLarge, isCompleted: true)
    
    
    RecipeCombineImage(recipe: ChallengeRecipe.sampleData[2], sizeType: .medium)
}

