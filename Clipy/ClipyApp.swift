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
  @State private var userSelectedIcon = UserDefaults.standard.string(forKey: Constants.AppStorageKeys.menuBarIcon)

  var body: some Scene {
    Settings { SettingsView().frame(maxWidth: .infinity) }.windowResizability(.automatic)
    MenuBarExtra("Clipy", systemImage: setIcon()) { AppMenu(viewModel: AppMenuViewModel()) }
  }

  private func setIcon() -> String {
    if let unwrappedIcon = userSelectedIcon {
      return unwrappedIcon
    }
    return "clipboard"
  }
}
