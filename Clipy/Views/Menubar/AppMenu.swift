//
//  AppMenu.swift
//  Clipy
//
//  Created by Miral Desai on 26/11/2023.
//

import SwiftUI

struct AppMenu: View {
  var body: some View {
    Divider()
    SettingsLink {Text("Preferences")}.keyboardShortcut(",")
    Button("Quit") {NSApplication.shared.terminate(nil)}.keyboardShortcut("Q")
  }
}

#Preview {
  AppMenu()
}
