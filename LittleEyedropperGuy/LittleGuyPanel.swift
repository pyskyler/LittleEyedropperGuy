//
//  LittleGuyView.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//

import SwiftUI
import AppKit



class LittleGuyPanel<Content: View>: NSPanel {
    @Binding var isOpen: Bool

    init(
        @ViewBuilder view: () -> Content,
        contentRect: NSRect,
        isOpen: Binding<Bool>) {
            self._isOpen = isOpen
    
            super.init(
                contentRect: contentRect,
                styleMask: [.nonactivatingPanel],
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
        isOpen = false
    }
    
    override var canBecomeKey: Bool {
        return true
    }
     
    override var canBecomeMain: Bool {
        return true
    }
}
