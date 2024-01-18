//
//  AppDelegate.swift
//  Clipy
//
//  Created by Miral Desai on 26/11/2023.
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
  func applicationDidFinishLaunching(_ notification: Notification) {
    CopyListener.shared().start()
    ShortcutEvent.init().start()
  }
}
