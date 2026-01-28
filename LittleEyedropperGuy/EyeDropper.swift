//
//  EyeDropper.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/28/26.
//

import AppKit
import ScreenCaptureKit
import CoreGraphics
import SwiftUI

class EyeDropper {
    
    var clickMonitor: Any?
    var isWaitingForClick: Bool = false
    
    func start() {
        print("got click")
        waitForClick(perform: sampleColor)
    }
    
    func waitForClick( perform action: @escaping (NSEvent) -> Void ) {
        if !isWaitingForClick {
            isWaitingForClick = true
            print("waiting for second click")
            clickMonitor = NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.leftMouseDown, handler: sampleColor)
        }
    }
    
    func sampleColor(event: NSEvent) {
        print("got second click")
        let mousePoint:NSPoint = NSEvent.mouseLocation
        NSEvent.removeMonitor(clickMonitor as Any)
        isWaitingForClick = false
        takeScreenshotAtPoint(point: mousePoint)
        
    }
    
    func takeScreenshotAtPoint(point: NSPoint) {
        let screenshotLocation: CGRect = CGRect(origin: point, size: CGSize(width: 1, height: 1))
        let screenshotConfiguration = SCStreamConfiguration()
        screenshotConfiguration.showsCursor = false
        screenshotConfiguration.sourceRect = screenshotLocation
        SCScreenshotManager.captureImage(in: screenshotLocation, completionHandler: handleScreenshot)
        
        
        
    }
    
    func handleScreenshot(image: CGImage?, error:Error?) {
        
        print("handing screenshot")
        
        if (error != nil) {
            print(error)
        }
        
        guard let cgImage: CGImage = image else {
            print("image error")
            return
        }
        
        //testin
        var ciImage = CIImage(cgImage: cgImage)
            
        
        guard let data = cgImage.dataProvider?.data,
              let bytes = CFDataGetBytePtr(data) else {
            fatalError("Couldn't access image data")
        }
        assert(cgImage.colorSpace?.model == .rgb)
        
        let bytesPerPixel = cgImage.bitsPerPixel / cgImage.bitsPerComponent
        for y in 0 ..< cgImage.height {
            for x in 0 ..< cgImage.width {
                let offset = (y * cgImage.bytesPerRow) + (x * bytesPerPixel)
                let components = (r: bytes[offset], g: bytes[offset + 1], b: bytes[offset + 2])
                print("[x:\(x), y:\(y)] \(components)")
            }
            print("---")
        }
        
        
    }
}
