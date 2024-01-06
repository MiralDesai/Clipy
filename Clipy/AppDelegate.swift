//
//  AppDelegate.swift
//  Clipy
//
//  Created by Miral Desai on 26/11/2023.
//

import AppKit
import RealmSwift
import KeyboardShortcuts

class AppDelegate: NSObject, NSApplicationDelegate {
  func applicationDidFinishLaunching(_ notification: Notification) {
    CopyListener.shared().start()

    KeyboardShortcuts.onKeyDown(for: .openMenu) { [self] in
      let statusItem = NSApp.windows.first?.value(forKey: "statusItem") as? NSStatusItem
      statusItem?.button?.performClick(nil)
    }
  }
}
