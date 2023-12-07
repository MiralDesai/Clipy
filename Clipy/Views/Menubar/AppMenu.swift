//
//  AppMenu.swift
//  Clipy
//
//  Created by Miral Desai on 26/11/2023.
//

import SwiftUI
import RealmSwift

struct AppMenu: View {
  var body: some View {
    Divider()
    Button("Clear history") { clearClipboardHistory() }.keyboardShortcut(KeyEquivalent.delete, modifiers: [.command, .option])
    SettingsLink {Text("Preferences")}.keyboardShortcut(",")
    Button("Quit") {NSApplication.shared.terminate(nil)}.keyboardShortcut("Q")
  }
}

func clearClipboardHistory() {
  let realm = try! Realm()
  try! realm.write {
    realm.deleteAll()
  }
}

#Preview {
  AppMenu()
}
