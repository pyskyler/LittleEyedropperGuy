//
//  LittleGuyView.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//

import SwiftUI


class LittleGuyView<Content: View>: NSPanel {
    @Binding var LittleGuyOpen: Bool

    init(
        @ViewBuilder view: () -> Content,
        contentRect: NSRect,
        LittleGuyOpen: Binding<Bool>) {
            self._LittleGuyOpen = LittleGuyOpen
    
            super.init(
                contentRect: contentRect,
                styleMask: [.utilityWindow],
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
    

    override func close() {
        super.close()
        LittleGuyOpen = false
    }
    
    override var canBecomeKey: Bool {
        return true
    }
     
    override var canBecomeMain: Bool {
        return true
    }
}
