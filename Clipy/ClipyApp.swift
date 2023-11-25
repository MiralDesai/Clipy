//
//  ClipyApp.swift
//  Clipy
//
//  Created by Miral Desai on 24/11/2023.
//

import SwiftUI

@main
struct ClipyApp: App {
  @State private var command: String = "a"
  
  var body: some Scene {
    Settings {
      SettingsView().frame(maxWidth: .infinity)
    }.windowResizability(.automatic)
    MenuBarExtra(command, systemImage: "\(command).circle") {
//      let pasteboard = NSPasteboard.general
      Divider()
      SettingsLink{ Text("Preferences") }.keyboardShortcut(",")
      Button("Quit") { NSApplication.shared.terminate(nil) }.keyboardShortcut("Q")
    }
  }
}
