//
//  PasteManager.swift
//  Clipy
//
//  Created by Miral Desai on 07/01/2024.
//

import AppKit
import SwiftUI
import Sauce

class PasteManager {
  @State private var shouldPasteWithFormatting = UserDefaults.standard.bool(forKey: "pasteWithFormatting")

  func paste() {
    //shouldPasteWithFormatting ? pasteWithFormatting() : pasteWithoutFortmatting()
    pasteWithoutFortmatting()
  }

  func pasteWithoutFortmatting() {
    let vKeyCode = Sauce.shared.keyCode(for: .v)
    let keyDown = CGEvent(keyboardEventSource: nil, virtualKey: vKeyCode, keyDown: true)
    keyDown?.flags = CGEventFlags.maskCommand
    keyDown?.post(tap: CGEventTapLocation.cghidEventTap)

    let keyUp = CGEvent(keyboardEventSource: nil, virtualKey: vKeyCode, keyDown: false)
    keyUp?.flags = CGEventFlags.maskCommand
    keyUp?.post(tap: CGEventTapLocation.cghidEventTap)
  }

  // Untested - need to copy with formatting
  func pasteWithFormatting() {
    //    let keyDown = CGEvent(keyboardEventSource: eventSource, virtualKey: 0x09, keyDown: true) // opt-shft-cmd-v down
    //    keyDown?.flags = [CGEventFlags.maskCommand, CGEventFlags.maskShift, CGEventFlags.maskAlternate]
    //    keyDown?.post(tap: CGEventTapLocation.cghidEventTap)

    //    let keyUp = CGEvent(keyboardEventSource: eventSource, virtualKey: 0x09, keyDown: false) // opt-shf-cmd-v up
    //    keyUp?.flags = [CGEventFlags.maskCommand, CGEventFlags.maskShift, CGEventFlags.maskAlternate]
    //    keyUp?.post(tap: CGEventTapLocation.cghidEventTap)
  }
}
