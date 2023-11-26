//
//  ClipyApp.swift
//  Clipy
//
//  Created by Miral Desai on 24/11/2023.
//

import SwiftUI

@main
struct ClipyApp: App {
  var body: some Scene {
    Settings {
      SettingsView().frame(maxWidth: .infinity)
    }.windowResizability(.automatic)
    MenuBarExtra("a", systemImage: "a.circle") {
//      let pasteboard = NSPasteboard.general
      Button("Log") { CopyListener.do_something() }
      Divider()
      SettingsLink {Text("Preferences")}.keyboardShortcut(",")
      Button("Quit") { NSApplication.shared.terminate(nil) }.keyboardShortcut("Q")
    }
  }
}
