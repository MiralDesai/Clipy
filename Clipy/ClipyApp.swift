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
    MenuBarExtra(command, systemImage: "\(command).circle") {
      Button("Uno") { command = "a" }.keyboardShortcut("U")

      Divider()
      Button("Quit") { NSApplication.shared.terminate(nil) }.keyboardShortcut("Q")
    }
  }
}
