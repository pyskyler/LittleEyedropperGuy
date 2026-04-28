//
//  Untitled.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 2/15/26.
//

import AppKit

func RegisterUserDefaults() {
    UserDefaults.standard.register(defaults: [
        "useRgb": true,
        "useHexUpper": true,
        "useHexPound": true ])
}
