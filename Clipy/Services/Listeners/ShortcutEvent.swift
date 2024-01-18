//
//  PasteEvent.swift
//  Clipy
//
//  Created by Miral Desai on 12/01/2024.
//
import SwiftUI
import KeyboardShortcuts

class ShortcutEvent {
  @State private var shouldPaste = UserDefaults.standard.bool(forKey: Constants.AppStorageKeys.pasteImmediately)

  func start() {
    KeyboardShortcuts.onKeyDown(for: .openMenu) { [self] in
      let statusItem = NSApp.windows.first?.value(forKey: "statusItem") as? NSStatusItem
      statusItem?.button?.performClick(nil)
    }
  }
}
