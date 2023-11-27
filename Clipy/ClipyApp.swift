//
//  ClipyApp.swift
//  Clipy
//
//  Created by Miral Desai on 24/11/2023.
//

import SwiftUI

@main
struct ClipyApp: App {
  @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
    Settings { SettingsView().frame(maxWidth: .infinity) }.windowResizability(.automatic)
    MenuBarExtra("a", systemImage: "a.circle") { AppMenu() }
  }
}
