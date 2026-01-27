//
//  LittleGuyModel.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//
import SwiftUI

@Observable class LittleGuy {
    
    var isOpen: Bool = false
    var image: Image = Image(systemName: "cat")
    var lastHoverState = false
    var isAnimationRunning: Bool = false
    
    func checkHoverForAnimation(hoverState: Bool) {
        if (lastHoverState && lastHoverState != hoverState) {
            runBasicAnimation()
        }
        lastHoverState = hoverState
    }
    
    func runBasicAnimation() {
        runImageAnimation(imageSetName: "stardewcat", numOfImages: 4, numOfRuns: 3, timeIntervalSecs: 0.16)
        
    }
    
    func runImageAnimation(imageSetName: String, numOfImages: Int, numOfRuns: Int = 1, timeIntervalSecs: Double = 0.08) {
                
        var index = 1
        var repeats = 0
        let timer = Timer.scheduledTimer(withTimeInterval: timeIntervalSecs, repeats: true) { (Timer) in
                
        self.image = Image("\(imageSetName)\(index)")
                
        index += 1
            
            
        if (index > numOfImages){
            index = 1
            repeats += 1
            }
            
        if ( repeats >= numOfRuns && index == 2) { Timer.invalidate() }
            
        }
    }
}

