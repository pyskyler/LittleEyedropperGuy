//
//  LittleGuyModel.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//
import SwiftUI

@Observable class LittleGuyImage {
    var image: Image = Image("stardewcat1")
}

@Observable class LittleGuy {
    
    var isOpen: Bool = false
    let imageObject: LittleGuyImage
    var lastHoverState = false
    var isAnimationRunning: Bool = false
    let stardewCatAnimation: ImageAnimation
    var failedAnimationTriggersLastSeconds: [Date] = []
    var lastPetTime: Date = Date()
    let eyeDropper:EyeDropper = EyeDropper()
    
    init(imageObject: LittleGuyImage = LittleGuyImage() ) {
        self.imageObject = imageObject
        self.stardewCatAnimation = ImageAnimation(imageSetName: "stardewcat", numOfImages: 4, numOfRuns: 3, timeIntervalSecs: 0.16, littleGuyImage: imageObject)
    }
    
    func checkHoverForAnimation(hoverState: Bool) {
        if (lastHoverState && lastHoverState != hoverState) {
            if (lastPetTime.timeIntervalSinceNow < -0.15) {
                lastPetTime = Date()
                animationActionTaken(actionStrength: 10)
            }
        }
        lastHoverState = hoverState
    }
    
    func tapped() {
        animationActionTaken(actionStrength: 25)
    }
    
    // Attempt to run an animation check to see if run succeedes
    // Action strength is percent chance for an action to trigger an animation
    // 100 / Action strength *2 is the amount of times that action if repeated will trigger an event
    func animationActionTaken(actionStrength: Int = 25) {
        let RandomInt = Int.random(in: 1...100)
        if (RandomInt < actionStrength) {
            print("\(RandomInt) < \(actionStrength)")
            self.stardewCatAnimation.run()
            failedAnimationTriggersLastSeconds = []
        } else {
            print("\(RandomInt) > \(actionStrength)")
            print("\(failedAnimationTriggersLastSeconds)")
            // clear old actions
            for date in failedAnimationTriggersLastSeconds {
                print("Date: \(date) is interval \(date.timeIntervalSinceNow)")
                if (date.timeIntervalSinceNow < -10.0) {
                    if let index = failedAnimationTriggersLastSeconds.firstIndex(of: date) {
                      failedAnimationTriggersLastSeconds.remove(at: index)
                    }
                }
            }
            // add current action
            failedAnimationTriggersLastSeconds.append(Date())
            print("Failed Triggers: \(failedAnimationTriggersLastSeconds.count), Action Trheshold:  \(100/(2*actionStrength))")
            // if more actions have been taken than threshold, trigger
            if (failedAnimationTriggersLastSeconds.count >= (100/(2*actionStrength))) {
                print("\(failedAnimationTriggersLastSeconds.count) >= \(100/(2*actionStrength))")
                self.stardewCatAnimation.run()
                failedAnimationTriggersLastSeconds = []
            }
        }
    }
    
    func yarnBallClicked() {
        eyeDropper.start()
    }
}

