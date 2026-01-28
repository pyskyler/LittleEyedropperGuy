//
//  Animation.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/27/26.
//
import SwiftUI

class Animation {
        
    static var isAnimationRunning: Bool = false
    
    func run() {
        if (!Animation.isAnimationRunning) {
            self.animation()
        }
    }
    
    func animation() {
        
    }

    func stopAnimation(timer: Timer) {
    timer.invalidate()
    Animation.isAnimationRunning = false
    }
        
}

class ImageAnimation: Animation {
    
    var imageSetName: String = "stardewcat"
    var numOfImages: Int = 4
    var numOfRuns: Int = 1
    var timeIntervalSecs: Double = 0.08
    var littleGuyImage: LittleGuyImage = LittleGuyImage()
    
    init(imageSetName: String, numOfImages: Int, numOfRuns: Int = 1, timeIntervalSecs: Double = 0.08, littleGuyImage: LittleGuyImage) {
        self.imageSetName = imageSetName
        self.numOfImages = numOfImages
        self.numOfRuns = numOfRuns
        self.timeIntervalSecs = timeIntervalSecs
        self.littleGuyImage = littleGuyImage
    }
    

    
    override func animation() {
        var index = 1
        var repeats = 0
        Animation.isAnimationRunning = true
        let timer = Timer.scheduledTimer(withTimeInterval: timeIntervalSecs, repeats: true) { (Timer) in
                
            self.littleGuyImage.image = Image("\(self.imageSetName)\(index)")
                    
            index += 1
                
                
            if (index > self.numOfImages){
                index = 1
                repeats += 1
                }
                
            if ( repeats >= self.numOfRuns && index == 2) { self.stopAnimation(timer: Timer) }
                
        }
    }
}
