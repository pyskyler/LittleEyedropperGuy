//
//  LittleGuyView.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//

import SwiftUI
import AppKit



class LittleGuyPanel<Content: View>: NSPanel {
    private var littleGuy: LittleGuy

    init(
        @ViewBuilder view: () -> Content,
        contentRect: NSRect, littleGuy: LittleGuy) {
            
            self.littleGuy = littleGuy
    
            super.init(
                contentRect: contentRect,
                styleMask: [.nonactivatingPanel, .utilityWindow],
                backing: .buffered,
                defer: false)
                
            isFloatingPanel = true
            level = .floating
                            
            collectionBehavior = [.canJoinAllSpaces]
            animationBehavior = .utilityWindow
            isMovableByWindowBackground = true

            hidesOnDeactivate = false
            contentView = NSHostingView(rootView: view())
            backgroundColor = .clear
    }
    
//    override func resignMain() {
//        super.resignMain()
//        close()
//    }

    override func close() {
        super.close()
        littleGuy.isOpen = false
    }
    
    override var canBecomeKey: Bool {
        return true
    }
     
    override var canBecomeMain: Bool {
        return true
    }
}

#Preview("LittleGuyPanel Content") {
    // In previews, avoid creating NSPanel instances and instead preview the SwiftUI content
    let littleGuy = LittleGuy()
    LittleGuyView(littleGuy: littleGuy)
        .frame(width: 120, height: 120)
}

